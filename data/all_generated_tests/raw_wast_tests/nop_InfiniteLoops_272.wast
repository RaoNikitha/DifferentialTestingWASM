;; 3. Place `nop` instructions immediately before and after a `br_if` within a loop. Verify if the loop exits based on the correct evaluation of the `br_if` condition or if the presence of `nop` causes an infinite loop.

(assert_invalid
  (module
    (func (loop (nop) (br_if 0 (i32.const 1)) (nop)))
  )
  "unreachable")
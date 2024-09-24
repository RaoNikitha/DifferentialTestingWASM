;; Construct a loop that contains a block whose execution conditionally sets a flag that erroneously triggers an `unreachable` path. Ensure that the loop's control flow handles the flag correctly.

(assert_invalid
  (module
    (func (loop (param i32) (result i32)
      (block (br_if 0 (i32.const 1)) (unreachable))
    ))
  )
  "unreachable executed"
)
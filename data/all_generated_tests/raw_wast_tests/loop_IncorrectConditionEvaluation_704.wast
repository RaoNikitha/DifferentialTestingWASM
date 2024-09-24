;; 5. Create a loop that accumulates values and uses `br_if` to exit when a sum exceeds a threshold. Test multiple instances with varying thresholds to see if branches occur only when conditions trigger the expected value.

(assert_invalid
  (module (func (param i32) (result i32)
    (local i32)
    (i32.const 0)
    (set_local 1)
    (loop (result i32)
      (get_local 1)
      (i32.const 10)
      (i32.add)
      (set_local 1)
      (get_local 1)
      (i32.const 50)
      (i32.gt_s)
      (br_if 1)
      (br 0)
    )
  ))
  "br_if condition test"
)
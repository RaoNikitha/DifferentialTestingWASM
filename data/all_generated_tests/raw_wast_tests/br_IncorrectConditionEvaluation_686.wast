;; 7. **Test Description:**    Utilize a `br_if` within an infinitely looping structure that incorrectly pops conditions leading to forced exits from the loop even when conditions evaluate false, indicating operand stack mismanagement.

(assert_invalid
  (module (func
    (loop
      (br_if 0 (i32.const 1) (i32.const 0)) (unreachable)
    )
  ))
  "type mismatch"
)
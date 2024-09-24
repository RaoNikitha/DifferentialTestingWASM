;; 8. Create a function that modifies multiple values on the stack, followed by a `br_if` condition that branches based on these values. Incorrect condition evaluation will result in mismatched stack operations.

(assert_invalid
  (module
    (func $modify-stack
      (i32.const 10)
      (i32.const 20)
      (call $check_values)
      (br_if 0 (i32.const 1))
    )
    (func $check_values
      (param i32 i32)
      (result i32)
      (i32.add)
    )
  )
  "type mismatch"
)
;; 6. Test multiple values returned from function via return instruction:    - Define a function returning multiple values and invoke it from different contexts.    - Validate if the function correctly returns all the values, and the downstream instructions handle the returned stack.

(assert_invalid
  (module
    (func $multiple_values_return_i32 (result i32 i32)
      (i32.const 1) (i32.const 2) (return)
    )
    (func $invoke_multiple_values_return_i32
      (i32.const 0)
      (call $multiple_values_return_i32)
      (drop) (drop)
    )
  )
  "type mismatch"
)
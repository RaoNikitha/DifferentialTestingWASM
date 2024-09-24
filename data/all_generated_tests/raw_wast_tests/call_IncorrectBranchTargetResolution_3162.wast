;; 1. **Test Description**: Invoke a nested function call where the inner function includes a branching instruction (`br`) to an incorrectly resolved label. Verify the expected versus actual stack outputs.    - **Constraint**: Checks if the inner function’s branch target code is correctly executed.

(assert_invalid
  (module
    (func $inner 
      (block $label
        (i32.const 1)
        (br $undefined_label)
      )
    )
    (func $outer
      (call $inner)
    )
    (export "test" (func $outer))
  )
  "unknown label"
)
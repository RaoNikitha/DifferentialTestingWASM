;; 4. **Deeply Nested Blocks with Function Calls**:    - **Description**: Have a function with multiple deeply nested blocks and nested function calls within those blocks. Validate the return value and stack state.    - **Constraint**: Ensure proper depth handling and stack unwinding.    - **Improper Handling**: Deeply nested blocks with function calls may not unwind the stack correctly, failing to return proper values.

(assert_invalid
  (module (func $deeply-nested-blocks-with-function-calls (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 42)
            (call $dummy)
            (br 3 (i32.const 0))
          )
          (i32.const 1)
          (call $dummy)
          (br 2)
        )
        (i32.const 2)
        (br 1)
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)
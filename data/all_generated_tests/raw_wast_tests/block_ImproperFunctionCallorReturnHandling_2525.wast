;; 6. **Multiple Function Calls with Different Return Types**:    - **Description**: Inside a block, sequentially call multiple functions with varying return types. Verify if the block manages these different return types correctly on the stack.    - **Constraint**: Validate the handling of multiple sequential return types.    - **Improper Handling**: Mishandling different return types might result in incorrect stack states or type errors.

(assert_invalid
  (module (func $type-multiple-function-calls (result i32)
    (block (result i32)
      (call $func1)
      (call $func2)
      (call $func3)
    )
  )
  (func $func1 (result i32) (i32.const 0))
  (func $func2 (result f32) (f32.const 0.0))
  (func $func3 (result i64) (i64.const 0))
  )
  "type mismatch"
)
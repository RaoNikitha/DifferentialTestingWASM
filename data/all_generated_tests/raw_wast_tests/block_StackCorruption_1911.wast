;; 2. **Unreachable Code with Incorrect Type Push**:    - Insert unreachable code within a block that pushes a type not specified by the block type, followed by valid instructions.    - Check if both implementations correctly handle the unreachable code without affecting the stack or if stack corruption occurs.

(assert_invalid
  (module (func $unreachable-with-invalid-type-push
    (block (result i32) (unreachable) (f64.const 1.0) (i32.const 1))
  ))
  "type mismatch"
)
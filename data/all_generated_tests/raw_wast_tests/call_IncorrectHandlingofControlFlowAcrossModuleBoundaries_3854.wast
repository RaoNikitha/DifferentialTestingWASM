;; 3. **Nested Calls to Imported Functions with Incorrect Signature**:    - **Reasoning**: This scenario tests the capability to handle nested calls to imported functions with differing signatures.    - **Description**: Implement nested function calls in one module that calls an imported function with varied signatures. Ensure that the engine handling the nested calls correctly respects the import's function signature without corrupting the stack.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (func $nested_call_invalid
      (call $imported_func (i32.const 1) (call $imported_func (i32.const 2)))
    )
  )
  "type mismatch"
)
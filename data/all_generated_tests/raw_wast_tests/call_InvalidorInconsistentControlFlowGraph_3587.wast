;; 6. **Nested Function Calls with Type Errors**:    - **Test Description**: Create a chain of nested function calls where an inner function receives incorrect types.    - **Constraint Checked**: Nested call handling and type propagation.    - **CFG Relevance**: Validates that nested calls are correctly managed in the CFG, particularly for type consistency.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $inner (param i32) (result i32) (i32.const 42))
    (func $outer
      (call $inner (f64.const 3.14))
    )
  )
  "type mismatch"
)
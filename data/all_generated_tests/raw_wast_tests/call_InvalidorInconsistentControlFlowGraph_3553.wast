;; 2. **Test for Incorrect Argument Types in Function Call**:    - **Description**: Call a function with mismatched argument types (e.g., passing an integer where a float is expected).    - **Constraint Checked**: Type consistency of arguments with function signature.    - **CFG Relevance**: Ensures CFG maintains accurate type information across function calls.

(assert_invalid
  (module
    (func $type-mismatch-wrong-arg (call 1 (i32.const 42)))
    (func (param f32))
  )
  "type mismatch"
)
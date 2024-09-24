;; 2. **Test Description**:    - **Constraint Checked**: Excess Arguments on Stack    - **CFG Relevance**: Verifies that excess arguments on the stack are correctly managed and cause the expected error.    - **Expected Behavior**: The Wizard Engine should trigger an arity mismatch error due to surplus arguments, while WebAssembly might handle it differently.

(assert_invalid
  (module
    (type (func (param i32 i32 i32)))
    (func $excess-args-func
      (call 0 (i32.const 1) (i32.const 2) (i32.const 3) (i32.const 4))
    )
  )
  "arity mismatch"
)
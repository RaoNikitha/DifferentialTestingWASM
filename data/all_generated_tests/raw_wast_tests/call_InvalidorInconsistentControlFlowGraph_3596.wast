;; 5. **Test Description**:    - **Constraint Checked**: Argument Transfer Order    - **CFG Relevance**: Verifies that arguments are transferred in the correct order from the stack to the function call.    - **Expected Behavior**: Differential behavior if arguments are not transferred in the correct order, leading to type or parameter misalignment errors.

(assert_invalid
  (module
    (func $argument-order-mismatch (call 1 (i32.const 10) (i64.const 20)))
    (func (param i64 i32))
  )
  "type mismatch"
)
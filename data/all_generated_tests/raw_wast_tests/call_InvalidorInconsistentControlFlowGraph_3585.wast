;; 4. **Excess Stack Values**:    - **Test Description**: Push extra arguments onto the stack before calling a function.    - **Constraint Checked**: Operand stack cleanliness (no excess values).    - **CFG Relevance**: Ensures CFG integrity by maintaining appropriate stack states before and after function calls.

(assert_invalid
  (module
    (func $excess-stack-values (i32.const 1) (i32.const 2) (call 0))
    (func (param i32))
  )
  "type mismatch"
)
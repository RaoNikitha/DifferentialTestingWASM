;; 2. **Mismatch Function Signature**:    - **Test Description**: Provide arguments of incorrect types for a function expecting specific types.    - **Constraint Checked**: Function type matching and stack operations.    - **CFG Relevance**: Validates that control flow properly checks operand types before proceeding, maintaining a consistent CFG.

(assert_invalid
  (module
    (func $mismatch-signature-func-call
      (call 0 (i32.const 42) (f64.const 3.14))
    )
    (func (param i32 i32))
  )
  "type mismatch"
)
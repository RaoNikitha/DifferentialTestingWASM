;; 4. **Test an invalid block type leading to misalignment in the expected operand stack while branching**:    - **Constraint Checked**: Ensures block types correctly dictate operand stack behavior.    - **Reasoning**: Incorrect operand stack handling can break CFG, leading to issues in nested branches.

(assert_invalid
  (module (func $invalid-block-type (result i32)
    (block (result i64) 
      (i32.const 10)
      (br 0)
    )
  ))
  "type mismatch"
)
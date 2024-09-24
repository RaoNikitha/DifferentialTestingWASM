;; 4. **Test Invalid Operand Stack Post-Branch**:    - **Description**: Design a branch that, if taken, leaves invalid types on the operand stack based on the target label's result type.    - **Constraint Checked**: Validates stack state correctness after branch.    - **Relation to Type Mismatch**: Ensures operation type expectations are met post-branch.

(assert_invalid
  (module (func $invalid-operand-stack-post-branch
    (block (result i32)
      (i32.const 42) (i64.const 0)
      (br_if 0 (i32.const 1))
    )
  ))
  "type mismatch"
)
;; 8. **Test Conditional Branch with Excessive Operands**:    - **Description**: Include additional operands beyond necessary on the stack that affect the branch blending into target instructions.    - **Constraint Checked**: Checks if excessive operands do not violate the target control structure's type constraints.    - **Relation to Type Mismatch**: Ensures type consistency with potential stack excesses.

(assert_invalid
  (module (func $conditional-branch-excessive-operands
    (block
      (br_if 0 (i32.const 1) (i32.const 42) (i32.const 7))
    )
  ))
  "type mismatch"
)
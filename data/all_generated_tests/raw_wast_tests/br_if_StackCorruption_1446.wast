;; 7. **Mixed Type Operand Stack Management**:    - **Description**: Test a `br_if` where the operand stack includes mixed types leading to type-matching challenges upon taking the branch. Investigate how both implementations handle stack consistency.    - **Constraint Checked**: Stack type consistency across branches.    - **Relation to Stack Corruption**: Monitors if mixed types cause stack malfunction when branching.

(assert_invalid
  (module
    (func $mixed-type-operand-stack
      (block $label
        (i32.const 1) (f64.const 1.0)
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)
;; 7. **Test Description: Indirect Call in Mixed Type Contexts:**    - Design a `br_table` that causes an indirect call within a mixed block of differing operand types, ensuring types check correctly.    - **Constraint Checked:** Confirms the branching handles type mismatches due to mixed contexts.    - **Relation to Function Call:** Validates robustness in type-checking against control flow complexity.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result f32)
        (br_table 0 1 (i32.const 0) (i32.const 0))
      )
    )
  ))
  "type mismatch"
)
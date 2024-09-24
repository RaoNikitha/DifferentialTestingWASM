;; 7. **Test: Unconditional Branch to Immediate Default**    - **Description:** Manually set the operand to immediately branch to the default label without checking other labels.    - **Constraint:** Ensures the default label is properly used when the operand suggests an out-of-bounds access.    - **Relation to Stack Corruption:** Verifies stack integrity when always falling back to the default label.

(assert_invalid
  (module
    (func $default_branch (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 10) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
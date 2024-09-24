;; 7. **Indirect Branch Default Target Handling**:    - **Description**: Use a `br_table` in a loop with an operand that often falls out of the valid range, causing frequent default target branches.    - **Constraint Checked**: Handling of `br_table` and default target fallback logic.    - **CFG Relevance**: Ensures the CFG correctly maps `br_table` branches to default targets when indices are out of bounds.

(assert_invalid
  (module
    (func $test
      (block
        (loop
          (block (result i32)
            (i32.const 0)
            (br_table 0 1 2)
          )
        )
      )
    )
  )
  "type mismatch"
)
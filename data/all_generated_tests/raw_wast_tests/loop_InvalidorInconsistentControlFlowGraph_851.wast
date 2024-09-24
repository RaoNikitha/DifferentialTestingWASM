;; 2. **Misalignment of Branch Targets**:    - **Description**: Design a loop that contains multiple `br_table` instructions with targets that include both valid `loop` labels and invalid/unreachable labels.    - **Constraint Checked**: Validating correct label indexing and ensuring `br_table` properly targets valid instructions only.    - **CFG Relevance**: Verifies the CFG accurately updates branches to valid positions, avoiding any misalignment or incorrect label targets.

(assert_invalid
  (module
    (func $branch-target-misalignment
      (i32.const 0)
      (br_table 0 1 2 3)
      (loop $loop1
        (i32.const 1)
        (br_table 0 1 3 4)
        (i32.const 2)
      end)
    )
  )
  "invalid label"
)
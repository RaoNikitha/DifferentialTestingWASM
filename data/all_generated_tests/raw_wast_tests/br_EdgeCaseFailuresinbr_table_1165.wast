;; 6. **Test for Non-Reachable Blocks:**    - Create `br_table` targets that include both reachable and non-reachable blocks.      - **Constraint Checked:** Ensures correct interpretation and execution branching to non-reachable blocks.      - **Edge Case Insight:** Validates error handling or skipping of non-reachable control flows.

(assert_invalid
  (module
    (func $non_reachable_blocks
      (block
        (br_table 0 1 (unreachable))
      )
    )
  )
  "type mismatch"
)
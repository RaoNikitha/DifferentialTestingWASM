;; 3. **Nested Loop with Misindexed Labels**:    - **Description**: Test nested loops where inner loops incorrectly reference labels intended for outer loops.    - **Constraint Checked**: Ensures correct label indexing within nested loops.    - **Relation to CFG**: Misindexed labels result in incorrect branching, disrupting the control flow.

(assert_invalid
  (module
    (func $nested-loop-label-error
      (i32.const 0)
      (loop (result i32)
        (loop (result i32) (br 1))
        (br 0)
      )
    )
  )
  "type mismatch"
)
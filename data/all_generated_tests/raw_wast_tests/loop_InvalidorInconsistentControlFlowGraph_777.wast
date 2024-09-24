;; 8. **Nested Loop with Misaligned Operand Stack**:    - **Description**: Test nested loops where the inner loop's operand stack misaligns due to incorrect operations by the outer loop.    - **Constraint Checked**: Validates proper operand stack management across nested scopes.    - **Relation to CFG**: Misalignment disrupts operand flow, leading to invalid CFG paths.

(assert_invalid
  (module
    (func
      (loop (result i32)   ;; outer loop
        (i32.const 1)
        (loop (result i32) ;; inner loop
          (i32.const 2)
          br 1  ;; should branch to the outer loop but misalign stack
        )
        drop
      )
    )
  )
  "type mismatch"
)
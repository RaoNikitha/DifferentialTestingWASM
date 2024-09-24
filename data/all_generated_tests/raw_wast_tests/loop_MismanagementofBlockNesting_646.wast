;; 7. **Test: Loop with Immediate Nested Loop**    - **Description**: A loop immediately followed by another nested loop. Include branches within inner loop targeting the outer loop.    - **Constraint Being Checked**: Inter-loop branch targeting.    - **Mismanagement**: Failure to recognize and branch correctly to outer loop.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (loop (result i32) (br 1))
        (drop)
      )
    )
  )
  "type mismatch"
)
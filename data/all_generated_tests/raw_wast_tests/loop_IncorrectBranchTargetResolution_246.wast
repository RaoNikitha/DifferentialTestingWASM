;; 7. **Test 7: Deeply Nested Loop Branch Target**    - Description: Construct deeply nested loops and inside the innermost loop, branch to an outer loop at a specific depth. Verify if the branch correctly resolves multiple levels of nested loops.    - Constraint: Evaluates accurate label indexing and context handling in deeply nested structures.

(assert_invalid
  (module
    (func $deeply-nested-loop-branch-target
      (loop (result i32)
        (loop (result i32)
          (loop (result i32)
            (br 2)
            (i32.const 1)
          )
          (drop)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)
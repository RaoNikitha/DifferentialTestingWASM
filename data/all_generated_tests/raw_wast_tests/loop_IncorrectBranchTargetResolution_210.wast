;; 1. **Test Input: Backward Branch to Incorrect Loop**    - Description: Test a backward branch using `br` that should target an inner `loop` but erroneously targets an outer `loop`.    - Constraint: Verify the correct label resolution for backward branches in nested loops.    - Focus: Check if the `br` instruction correctly identifies the nearest enclosing loop or mistakenly branches to an incorrect outer loop.

(assert_invalid
  (module
    (func
      (block
        (loop
          (i32.const 1)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)
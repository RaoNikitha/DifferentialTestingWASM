;; 10. **Invalid Forward Branch In Nested Loops:**    Generate a nested loop scenario where a `br` instruction incorrectly targets a forward label in an outer loop. Confirm if the test properly identifies the invalid branch and correctly handles the control flow to prevent reaching an `unreachable` instruction.

(assert_invalid
  (module
    (func $nested-loops-invalid-branch
      (loop (loop (br 1)))
    )
  )
  "invalid branch"
)
;; 10. **Test Description:**    - **Test Scenario:** Create a nested block structure with an `unreachable` instruction inside a `loop` and use a `br` instruction to exit the containing block.    - **Specific Constraint:** Ensure that the control flow logic handles exiting multiple nested blocks correctly.    - **Relation to Unreachable Code Execution:** Check that the `br` instruction bypasses the `loop` and its `unreachable` instruction, redirecting control flow out to the specified containing block.

(assert_invalid
  (module
    (func
      (block
        (loop
          (unreachable)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)
;; 1. **Test Description:** Create a nested block structure with a `br` instruction targeting an outer block. Ensure an `unreachable` instruction follows the `br`. Verify behavior when the branch erroneously allows execution to reach the `unreachable` instruction.     - **Constraint Checked:** Correct handling of outward branching to block labels.     - **Relation to Unreachable Code Execution:** Verifies if the branch implementation allows code execution to erroneously continue to an `unreachable` instruction.

(assert_invalid
  (module 
    (func 
      (block 
        (block 
          (br 1) 
          (unreachable)
        )
      )
    )
  )
  "unreachable executed"
)
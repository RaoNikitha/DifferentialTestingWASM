;; 3. **Test Case: Unreachable After Break in Loop**    - Description: Position the `unreachable` immediately after a `break` statement within a loop to test if the loop's premature termination is consistent.    - CFG Constraint: The test checks if the `break` correctly exits the loop and if the `unreachable` instruction is then properly trapped, testing the edge case of exiting and trapping.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br 1)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)
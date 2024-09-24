;; 10. **Jump into Non-Well-Nested Block:**     - Test Description: Create a non-well-nested control flow by using a `br` instruction to incorrectly jump into an inner block's body, causing an `unreachable` instruction to execute.     - Constraint: This ensures the structured control flow rules are enforced, preventing jumps into arbitrary or non-well-nested positions.  By creating these tests, differential behavior between the two implementations can be observed, especially focusing on ensuring that `br` instructions conform to the rules and handling constraints specified, preventing unintended execution of the `unreachable` instruction.

(assert_invalid
  (module
    (func $jump-into-non-well-nested
      (block
        (block
          (nop)
          (br 1)
          (unreachable)
        )
      )
    )
  )
  "unknown label"
)
;; 1. **Test Description:**    - **Test Scenario:** In a nested block structure, use the `br` instruction to target a label in an outer block and place an `unreachable` instruction in the inner block.    - **Specific Constraint:** Ensure that the `br` instruction correctly targets the outer block by interpreting the label index relative to the nesting depth.    - **Relation to Unreachable Code Execution:** Verify that the branch skips the inner block with the `unreachable` instruction and continues execution after the outer block.

(assert_invalid
  (module
    (func
      (block $outer
        (block $inner
          (unreachable)
          (br 1)
        )
      )
    )
  )
  "unreachable code"
)
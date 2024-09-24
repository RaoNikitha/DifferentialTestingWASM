;; 6. **Incorrect Label Target in Nested Blocks:**    - Test Description: Create nested `block` structures and use a `br` instruction with an invalid label index, violating the label lookup constraint and resulting in an `unreachable` instruction.    - Constraint: This test checks the correct referencing of labels in nested blocks by the `br` instruction.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br 3)
          )
        )
      )
    )
  )
  "unknown label"
)
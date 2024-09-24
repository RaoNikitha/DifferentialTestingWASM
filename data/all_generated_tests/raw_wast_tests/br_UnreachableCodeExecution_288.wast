;; 9. **Incorrect Relative Lookup in Deep Blocks:**    - Test Description: Use a sequence of deeply nested `block` instructions where a `br` instruction misinterprets the relative label index, jumping incorrectly and causing execution of an `unreachable` instruction.    - Constraint: This checks the correct operation of relative label indexing in deeply nested blocks.

(assert_invalid
  (module
    (func $deep-nested-label-misinterpret
      (block
        (block
          (block
            (block
              (block
                (block
                  (block (br 7))
                )
              )
            )
          )
        )
      )
      (unreachable)
    )
  )
  "unknown label"
)
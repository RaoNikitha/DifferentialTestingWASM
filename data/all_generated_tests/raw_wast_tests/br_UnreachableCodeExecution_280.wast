;; 1. **Deep Nesting with Incorrect Branch:**    - Test Description: Create a deeply nested structure with multiple levels of `block` and `loop` instructions and insert a `br` instruction that incorrectly targets an out-of-bounds label, causing control flow to reach an `unreachable` instruction at the bottom.    - Constraint: This test checks the proper handling of incorrect relative label indexing in a deeply nested context.

(assert_invalid
  (module
    (func $deep-nesting
      (block
        (loop
          (block
            (block
              (loop
                (block
                  (br 5)
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
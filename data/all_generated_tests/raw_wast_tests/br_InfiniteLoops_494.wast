;; 5. **Invalid Label Target within Nested Blocks**: Construct multiple nested blocks with a single loop where the `br` instruction incorrectly targets an invalid label, causing the loop to behave unexpectedly. This checks for proper label validation and correct loop termination.

(assert_invalid
  (module
    (func $invalid-label-target
      (block
        (block
          (loop
            (br 3)
          )
        )
      )
    )
  )
  "unknown label"
)
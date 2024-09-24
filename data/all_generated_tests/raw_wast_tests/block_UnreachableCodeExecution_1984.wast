;; 5. **Test Description**: A sequence of `block` instructions, each containing an `unreachable` instruction within nested inner blocks. This tests the validation of deeply nested contexts and ensures that inner `unreachable` instructions do not cause the entire sequence to break incorrectly.

(assert_invalid
  (module (func $nested-unreachable
    (block
      (block
        (block
          (unreachable)
          (br 0)
        )
        (br 0)
      )
      (br 0)
    )
  ))
  "type mismatch"
)
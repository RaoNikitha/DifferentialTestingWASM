;; 5. Construct a function with nested blocks where an `unreachable` instruction precedes a `br` instruction aimed at traversing multiple levels up. Confirm the `unreachable` trap is triggered, and the `br` correctly resolves its target without misdirection.

(assert_invalid
  (module (func $test_nested_blocks_unreachable_br
    (block
      (block
        (unreachable)
        (br 1)
      )
    )
  ))
  "unreachable instruction must trap"
)
;; 2. Create a nested structure with an inner `loop` inside a `block`, and use a `br` instruction to break out of the `loop`. Verify if the implementation correctly manages this by continuing execution after the `loop`'s `end`. This tests the ability to correctly handle branches targeting `loop` constructs within nested blocks.

(assert_invalid
  (module
    (func $nested-loop-break
      (block
        (loop
          (br 2)
        )
        (unreachable)
      )
    )
  )
  "unknown label"
)
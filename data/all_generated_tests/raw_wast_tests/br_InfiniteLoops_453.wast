;; A `block` containing a `br` instruction targeting a `loop` nested directly within it. Evaluate if the `br` instruction executes a backward jump to the `loop` start without creating an infinite loop.

(assert_invalid
  (module
    (func $test-nested-loop-br
      (block
        (loop (br 0))
      )
    )
  )
  "type mismatch"
)
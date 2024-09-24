;; 8. Create a test with a single `block` containing a nested `if` inside a `loop`, where a `br` instruction targets the `loop` from the `if`. This will verify correct management and exiting of nested conditional and looping structures.

(assert_invalid
  (module
    (func (block
      (loop
        (if
          (then (br 1))
        )
      )
    ))
  )
  "unknown label"
)
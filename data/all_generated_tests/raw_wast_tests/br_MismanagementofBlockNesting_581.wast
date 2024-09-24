;; 2. Test a scenario with a deeply nested loop followed by a `br` instruction targeting an intermediate block within the loop nesting. This tests if the implementation correctly manages the block and loop distinction and handles stack unwinding appropriately.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)
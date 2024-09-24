;; 8. Write a sequence with multiple nested `loop` structures and a `br` instruction targeting a `loop` label deeper than the current scope. Check for correct backward jump to the intended loop start position.

(assert_invalid
  (module
    (func
      (loop
        (loop
          (block
            (br 2)
          )
        )
      )
    )
  )
  "unknown label"
)
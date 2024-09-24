;; 5. Construct a test with three levels of nested loops and use a `br` instruction to target the second loop. Verify that the label resolution backward jumps to the correct loop, representing correct handling of nested loop structures.

(assert_invalid
  (module
    (func $nested-loop-br
      (loop (loop (loop
        (br 1)
      )))
    )
  )
  "label index out of range"
)
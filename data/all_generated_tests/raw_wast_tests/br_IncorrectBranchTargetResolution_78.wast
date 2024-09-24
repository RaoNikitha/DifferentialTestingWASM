;; 9. Set up a series of blocks where the `br` instruction targets a block that has the same label index as a higher level loop. Validate accurate label resolution and correct branching to the intended block.

(assert_invalid
  (module
    (func $test
      (block $label0
        (block $label1
          (loop $label2
            (br 1)
          )
        )
      )
    )
  )
  "label index out of bounds"
)
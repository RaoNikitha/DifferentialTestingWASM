;; 10. **Test Description: Reverse Loop Jump**     - Place a `br` instruction within a `loop` that incorrectly jumps to a previous block outside the loop, ensuring it tests the backward jump behavior and label resolution.

(assert_invalid
  (module
    (func $reverse-loop-jump
      (block
        (loop
          (br 1)
        )
      )
    )
  )
  "jump to previous block outside loop"
)
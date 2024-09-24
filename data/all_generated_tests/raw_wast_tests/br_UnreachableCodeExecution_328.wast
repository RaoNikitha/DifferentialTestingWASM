;; 9. **Multiple Loops with `br` to Outer Loop and Unreachable in Each Loop:**    - Set up multiple loops where a `br` instruction in an inner loop targets an outer loop and each loop contains an `unreachable` instruction.    - Ensures `br` to outer loops properly avoid inner loop unreachable instructions.

(assert_invalid
  (module
    (func
      (loop
        (loop
          (br 1)
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "unreachable instruction in loop"
)
;; 2. Define a loop expecting a float result, and inside it, use the `br` instruction to branch out without providing a float on the stack. This can check if the correct enforcement of result type constraints for the loop is in place.

(assert_invalid
  (module
    (func
      (loop (result f32)
        (br 1)
      )
    )
  )
  "type mismatch"
)
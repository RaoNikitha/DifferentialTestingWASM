;; 6. **Test Description 6**: Use nested loops where the inner loop contains `br` instructions and the outer loop ends with an `unreachable` instruction. Verifying if improper branch tunneling affects the control flow causing the outer `unreachable` instruction to be executed.

(assert_invalid
  (module
    (func $nested-loops
      (loop (result i32)
        (loop
          (br 1)
        )
        (unreachable)
      )
    )
  )
  "unreachable executed"
)
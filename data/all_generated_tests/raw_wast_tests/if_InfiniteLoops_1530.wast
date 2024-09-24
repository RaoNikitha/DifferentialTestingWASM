;; 1. A test where an `if` instruction with a true condition and an `else` containing an infinite `loop` instruction is nested within another `if` instruction, testing the correct handling of nested block labels within the `else` branch to prevent infinite execution.

(assert_invalid
  (module
    (func $nested-if-else-loop
      (if (i32.const 1)
        (then)
        (else
          (loop
            (if (i32.const 1)
              (then)
              (else
                (br 1)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
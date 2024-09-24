;; 2. Generate a test with an `if` instruction that evaluates a non-zero condition and leads to a loop with an embedded counter to exit. Ensure the counter is manipulated inside nested blocks incorrectly. This can catch procedural transformers mishandling stack updates.

(assert_invalid
  (module (func $nested-if-loop-stack-error
    (if (i32.const 1)
      (then
        (loop
          (block
            (if (i32.const 0)
              (then
                (br 1)
                (i32.const 2)
              )
              (else
                (br 2)
              )
            )
          )
        )
      )
    )
  ))
  "type mismatch"
)
;; 2. A test with an `if` instruction inside a `loop`, where both the `then` and `else` sections of the `if` instruction contain their own nested loops. This checks if the implementation distinguishes correctly between the nested loop control flows during exits from the `if` or `else`.

(assert_invalid
  (module (func $nested-if-loop
    (i32.const 1)
    (loop (result i32)
      (if (result i32)
        ;; then branch with nested loop
        (i32.const 1)
        (loop (result i32) (i32.const 2) br 1)
        (then (i32.const 3))
        ;; else branch with nested loop
        (else
          (loop (result i32) (i32.const 4) br 1)
          (i32.const 5)
        )
      )
    )
  ))
  "improperly nested structure"
)
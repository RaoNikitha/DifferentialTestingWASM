;; - **Test Description 5**: A nested `if` instruction where the outer `if` condition is false and the inner `if` condition is true. Ensure the correct branch of the inner `if` is chosen based on its condition, regardless of the outer `if` branch chosen.

(assert_invalid
  (module
    (func $nested-if
      ;; Outer if condition is false
      (i32.const 0)
      (if (result i32)
        (i32.const 0)
        ;; Then branch of outer if
        (then
          ;; Inner if condition is true
          (i32.const 1)
          (if (result i32)
            (i32.const 1)
            (then (i32.const 1))
            (else (i32.const 2))
          )
        )
        ;; Else branch of outer if
        (else (i32.const 3))
      )
    )
  )
  "type mismatch"
)
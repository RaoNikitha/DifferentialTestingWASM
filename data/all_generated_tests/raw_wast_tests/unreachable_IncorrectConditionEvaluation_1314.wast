;; Implement a function that simulates a complex control flow with several nested conditionals (`if` statements). Place the `unreachable` instruction in branches that can only be accessed via incorrect condition evaluations, ensuring unexpected traps due to condition misinterpretation.

(assert_invalid
  (module
    (func $differential-test
      (if (i32.const 1)
        (then
          (if (i32.const 0)
            (then (unreachable))
            (else (i32.const 1))
          )
        )
        (else
          (block
            (if (i32.const 0)
              (then (unreachable))
              (else (f32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
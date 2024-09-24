;; Test 5: Nest an infinite loop inside a function where the inner loop contains an `unreachable` immediately followed by `loop` instruction, and verify if the trap correctly interrupts execution.

(assert_invalid
  (module
    (func $nested-loop-unreachable
      (loop
        (unreachable)
        (loop
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)
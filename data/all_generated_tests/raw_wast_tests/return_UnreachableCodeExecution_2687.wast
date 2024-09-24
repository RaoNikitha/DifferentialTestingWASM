;; Test 6: Craft an if-else block within a function where the `else` branch contains an `unreachable` instruction, and the true branch has an early return. Verify that returning from true branch prevents the execution of `unreachable` block.

(assert_invalid
  (module
    (func $test_6 (result i32)
      (i32.const 1)
      (if (result i32)
        (then (return (i32.const 42)))
        (else (unreachable))
      )
    )
  )
  "type mismatch"
)
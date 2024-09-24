;; 4. Implement an `if-then-else` statement with the `else` branch containing an `unreachable` instruction. Ensure the test can detect whether the type compiler correctly enforces that both branches yield consistent stack types.

(assert_invalid
  (module (func $test-if-unreachable (result i32)
    (if (result i32)
      (i32.const 1)
      (unreachable)
    )
  ))
  "type mismatch"
)
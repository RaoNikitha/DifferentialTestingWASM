;; - Test an `if` block without an `else` branch where the `then` block contains an `unreachable` instruction that should never be executed due to a false `if` condition. This tests if the erroneous execution reaches unreachable code.

(assert_invalid
  (module
    (func $test-unreachable-in-then-no-else (result i32)
      (if (i32.const 0) (then (unreachable)) (i32.const 42))
    )
  )
  "type mismatch"
)
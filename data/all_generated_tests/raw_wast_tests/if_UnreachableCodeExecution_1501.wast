;; Test an `if` block with a trivial `else` branch and an `unreachable` instruction at the end of the `then` block. Evaluate if false conditions correctly avoid executing the `unreachable` statement.

(assert_invalid
  (module
    (func $test-unreachable-then (result i32)
      (if (result i32)
        (i32.const 0)
        (then (i32.const 42) (unreachable))
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)
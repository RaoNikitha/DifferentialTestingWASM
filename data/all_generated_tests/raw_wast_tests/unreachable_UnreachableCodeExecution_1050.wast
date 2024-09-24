;; 1. Test a function containing an `if` statement with a true condition that executes an `unreachable` instruction, ensuring immediate termination regardless of the surrounding code.

(assert_invalid
  (module (func $test-unreachable-in-if-true
    (if (i32.const 1)
      (then
        (unreachable)
      )
    )
    (i32.const 0)
  ))
  "type mismatch"
)
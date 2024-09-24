;; - Test an `if` block with a condition that evaluates to true, but the false branch is erroneously executed, leading to an `unreachable` instruction within the false branch. Check if the incorrect condition evaluation causes the trap unexpectedly.

(assert_invalid
  (module (func $test-if-branch-unreachable (result i32)
    (if (i32.const 1)
      (then (i32.const 42))
      (else (unreachable) (i32.const 0))
    )
  ))
  "type mismatch"
)
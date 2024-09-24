;; Create a nested `if-else` which includes comparisons between `i64` values. Place `unreachable` in an incorrect branch that should not be executed. Observe if condition misplacements lead to traps.

(assert_invalid
  (module (func $test_unreachable_nested_if_else (result i32)
    (i64.const 0) (i64.const 1)
    (if (result i32) (i64.eq)
      (then (unreachable))
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)
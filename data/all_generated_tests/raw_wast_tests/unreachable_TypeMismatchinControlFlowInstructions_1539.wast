;; 10. Have `unreachable` within an `if-else` construct where both branches are expected to return `i32`, but deliberately cause one branch to return `i64`. Check engines for type mismatch error consistency.

(assert_invalid
  (module (func
    (result i32)
    (if (result i32)
      (i32.const 1)
      (unreachable)
      (i64.const 0)
    )
  ))
  "type mismatch"
)
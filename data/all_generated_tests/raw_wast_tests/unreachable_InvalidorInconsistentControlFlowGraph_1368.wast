;; 9. **Test Case: Unreachable in Function Call Chain**    - Description: Have a function call another function that immediately traps with `unreachable` to test if the top-level function correctly propagates the trap.    - CFG Constraint: The test checks if the control flow across nested function calls correctly halts when encountering `unreachable`, verifying inter-function CFG consistency.

(assert_invalid
  (module
    (func $inner (unreachable))
    (func $outer
      (call $inner)
      (i32.const 0) ; unreachable ensures this is never reached
    )
  )
  "type mismatch"
)
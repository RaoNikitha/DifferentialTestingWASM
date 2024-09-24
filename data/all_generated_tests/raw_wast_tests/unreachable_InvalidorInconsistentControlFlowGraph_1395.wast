;; 6. **Mismatch Between Unreachable and Arith Operations:**    - Context: Use an arithmetic operation like `i32.add` immediately after `unreachable`.    - Constraint: Confirm CFG terminates control flow correctly, ensuring operation after `unreachable` is never reached.    - Expected Behavior: Execution should trap at `unreachable` consistently, without performing the arithmetic operation in both implementations.

(assert_invalid
  (module (func $test-unreachable-arith
    (unreachable) (i32.add (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)
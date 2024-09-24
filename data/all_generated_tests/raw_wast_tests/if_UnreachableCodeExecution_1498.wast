;; 9. **Test Mismatched Operand Stack and Unreachable**:    - An `if` introducing stack mismatches that normally should lead to a trap, place `unreachable` after it's resolved. Verify if resetting context avoids this trap.

(assert_invalid
  (module (func $if-stack-mismatch-unreachable
    (block (if (result i32)
      (i32.const 1)
      (then (i32.const 1))
      (else (i32.const 1) (i32.const 2))
    ) (unreachable))
  ))
  "type mismatch"
)
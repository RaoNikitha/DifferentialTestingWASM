;; 6. **Mismatch Block Type Ends In Unreachable**:    - Use a block where the `blocktype` mismatches the operand stack, followed by `unreachable`.    - Validates proper stack type semantics and operand stack adjustments.    - Incorrect stack state handling leading to `unreachable` execution.

(assert_invalid
  (module (func $type-mismatch-blocktype-unreachable
    (block (result i32) (f64.const 0.0) (unreachable))
  ))
  "type mismatch"
)
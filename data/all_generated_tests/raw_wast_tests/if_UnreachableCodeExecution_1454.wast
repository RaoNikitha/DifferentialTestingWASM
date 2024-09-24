;; 5. **Invalid Block Type leading to Unreachable**:    - Use an incorrect block type for the `if` instruction, which pushes an unexpected type, ultimately leading to an unreachable path.    - **Constraint**: Verifies proper block type validation and the resulting trap from an incompatible operand stack.

(assert_invalid
  (module (func $invalid-block-type-unreachable
    (if (param i64) (then (unreachable)) (else (nop)))
  ))
  "type mismatch"
)
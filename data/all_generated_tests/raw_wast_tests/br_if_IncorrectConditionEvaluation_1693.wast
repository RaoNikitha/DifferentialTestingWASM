;; 4. **Test Negative Label Index**:    - **Description**: Use a negative label index in the `br_if` instruction.    - **Constraint**: Label indices must be non-negative.    - **Incorrect Condition Evaluation**: The `br_if` might try to access an invalid label, leading to an unintended jump and error.

(assert_invalid
  (module (func $negative-label-idx (block (br_if -1 (i32.const 1)))))
  "invalid label"
)
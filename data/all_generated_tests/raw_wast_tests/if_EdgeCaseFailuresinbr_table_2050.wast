;; 1. **Uninitialized State Before `br_table` Evaluation**:    - Test a `br_table` instruction in an `if` block where the block contains multiple indices, ensuring that each index properly maps to its target. The test should verify that the `br_table` consistently behaves the same way across implementations, especially if the state is not explicitly initialized. This can highlight any implicit initialization discrepancies.

(assert_invalid
  (module (func (result i32)
    (if (result i32) (i32.const 1)
      (then (br_table 0 1)) (else (i32.const 0))
    )
  ))
  "invalid label"
)
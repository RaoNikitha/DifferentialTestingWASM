;; 9. **Test with Immediate Return After `br_table`**:    - **Description**: Have a `br_table` instruction followed immediately by a `return`, with varied indices to hit different target blocks.    - **Relation to Edge Case**: Ensures that the return instruction properly accounts for the stack unwinding post-branching operations, maintaining consistency.

(assert_invalid
  (module
    (func $test (result i32)
      (block i32
        (br_table 0 0 (return))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
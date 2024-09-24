;; 6. **Test: Misaligned Type Expectations in `then` Block**    - **Description**: Create an `if` instruction where the `then` block has instructions that produce a different type than expected by the block type.    - **Constraint Checked**: Ensures the `then` block produces the correct types as per the block type.    - **CFG Relevance**: Validates CFG handling of type alignment in `then` branch execution.

(assert_invalid
  (module (func $misaligned-types-then (result i32)
    (if (result i32) (i32.const 1)
      (then (i64.const 2))
      (else (i32.const 3))
    )
  ))
  "type mismatch"
)
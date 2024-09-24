;; 5. **Floating-Point Index**:    - Include a `br_table` instruction attempting to use a floating-point number as an index.    - **Constraint**: Ensure type safety by verifying index type adherence.    - **Edge Case**: Handling invalid index types causing unexpected behavior.

(assert_invalid
  (module
    (func $invalid-float-index
      (block
        (br_table 0.0 (return))
      )
    )
  )
  "type mismatch"
)
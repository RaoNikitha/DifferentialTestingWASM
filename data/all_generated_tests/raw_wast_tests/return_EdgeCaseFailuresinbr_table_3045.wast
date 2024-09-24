;; 4. **Test with Negative Index**:    - **Description**: Pass a negative index to the `br_table` instruction. This test checks how the return instruction unwinds the stack when invalid indices are used.    - **Relation to Edge Case**: Ensures robustness and proper exception handling, confirming that no undefined behavior occurs with negative indices.

(assert_invalid
  (module
    (func $br_table-invalid-index (result i32)
      (i32.const 0)
      (block (br_table -1 (return)))
    )
  )
  "type mismatch"
)
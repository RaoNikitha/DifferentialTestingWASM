;; 1. **Test with Exceeding Index**:    - Create a block with a `br_table` instruction where the index value exceeds the number of specified labels and default targets. This checks if the implementation properly handles out-of-bounds indices.    - **Constraint Checked**: Index out of bounds for `br_table`.

(assert_invalid
  (module (func $test-block-br_table-out-of-bounds
    (block
      (i32.const 0)
      (br_table 0 1 2 3 (i32.const 10))  ;; Exceeds the number of labels and default targets
    )
  ))
  "br_table index out of bounds"
)
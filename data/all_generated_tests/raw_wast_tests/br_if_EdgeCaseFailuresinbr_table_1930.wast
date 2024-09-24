;; 1. **Test Description**:    - **Constraint Checked**: Index out of bounds in `br_table`.    - **Details**: Craft a `br_table` instruction with an index operand far exceeding the number of defined labels. This will verify if `OobLabel` error handling catches invalid indices.    - **Relation to Edge Case**: Ensures robust handling of out-of-bound indices, which should trigger specific error signaling used by `wizard_engine`.

(assert_invalid
  (module (func $out-of-bounds-label (block (br_table 0 1 2 (i32.const 4)))))
  "unknown label"
)
;; 10. **Test Description**: A `block` encompassing another block with a `br_table` that includes invalid indices to test label error handling.    **Reasoning**: Checks the robustness of label resolution against invalid indices in `br_table`, ensuring the correct exception is raised or branch handled properly.

(assert_invalid
  (module (func $invalid-br_table
    (block (block (br_table 3 (i32.const 0))))
  ))
  "unknown label"
)
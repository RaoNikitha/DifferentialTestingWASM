;; 8. **`br_table` with Non-Sequential Indexes**:    - **Description**: Use a `br_table` inside a loop with non-sequential target indices and validate with an index operand not matching any target.    - **Constraint**: Checks non-sequential indexing within branch tables, ensuring gaps lead to correct default behavior.

(assert_invalid
  (module
    (func $br_table_non_seq_index (param i32)
      (loop (block (result i32)
        (block (br_table 1 0 2 (local.get 0)))
        (i32.const 0)
      ))
    )
  )
  "type mismatch or invalid branch target"
)
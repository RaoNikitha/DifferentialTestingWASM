;; Test a `loop` block with a `br_table` where the table index is negative, ensuring this invalid index results in taking the default branch without causing runtime errors or unexpected behavior.

(assert_invalid
  (module (func $br_table_invalid_index
    (loop (result i32)
      (i32.const -1)
      (br_table 0 1)
    )
  ))
  "type mismatch"
)
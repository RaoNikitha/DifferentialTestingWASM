;; 6. **Test Block with Unmatched `br_table` Labels**:    - Use a block containing a `br_table` that includes a list of invalid label indices.    - This checks proper handling of tables with arbitrary branch targets.    - Expected result: WebAssembly should reject the table, but wizard_engine might allow mismatched indices.

(assert_invalid
  (module (func $test_unmatched_br_table_labels
    (block (result i32)
      (block
        (br_table 1 2 3 (i32.const 0))
        (br 0)
      )
    )
  ))
  "unknown label"
)
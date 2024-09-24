;; 4. **Empty Table**:    - Test a `call_indirect` instruction on an empty table, expecting it to trap due to the absence of any callable function.    - This test checks that the `call_indirect` correctly handles edge cases where the table is defined but empty.    - It relates to `br_table` to ensure correct behavior when dealing with tables and absent function targets.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 0 funcref)
    (func $empty-table
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  )
  "element out of bounds"
)
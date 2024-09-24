;; 7. **Test Description**: Test `call_indirect` with a table containing non-function elements, ensuring it properly traps.    - **Constraint Checked**: Verifies that tables are enforced to contain only `funcref` elements.    - **Relation to `br_table` Edge Case**: Ensures element type constraints similar to the acceptable index targets in `br_table`.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 externref)
    (func $invalid-table-type
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)
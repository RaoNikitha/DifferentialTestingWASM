;; 9. **Test Description**: Apply `call_indirect` with a type index referring to an invalid or non-existent function type, confirming it traps.    - **Constraint Checked**: Ensures type indices are valid and correctly referenced.    - **Relation to `br_table` Edge Case**: Verifies valid reference constraints similar to the target index referential integrity in `br_table`.

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func (result i32)
      (call_indirect (type 999) (i32.const 0))
    )
  )
  "unknown type"
)
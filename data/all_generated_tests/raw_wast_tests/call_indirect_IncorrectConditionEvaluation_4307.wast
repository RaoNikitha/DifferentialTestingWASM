;; 6. **Table Reference Type Mismatch**:    Attempt to call a table that is not of type `funcref` using `call_indirect`, confirming that both implementations trap appropriately. This validates that the table reference type conforms to the `funcref` requirement.      **Constraint**: Ensure table types are strictly `funcref` for `call_indirect`.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 anyref)
    (func $type-table-not-funcref (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
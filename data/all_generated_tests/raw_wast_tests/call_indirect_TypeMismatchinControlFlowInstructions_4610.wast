;; 9. **Test Description**:    - Run a test where `call_indirect` is invoked within a block that has an indirect index out of bounds in the table, with the improper handling of the bound leading to a trap expected.    - **Constraint Being Checked**:      - Ensuring that table indices are validated against the table bounds and that out-of-bound accesses are trapped.    - **Relation to Control Flow Instructions**:      - Ensures control flow correctly addresses table index bounds and accesses.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32) (result i32) (local.get 0))
    (func (result i32)
      (i32.const 1)
      (call_indirect (type 0) (i32.const 2))
    )
  )
  "out of bounds table access"
)
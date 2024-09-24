;; 9. **Multiple Function Signatures**:    Create a table with multiple function signatures and call an indirect function ensuring correct function type conformity checks. This verifies complex type matching in indirect calls. Complex `br_table` instructions need accurate type conformity just as in `call_indirect`.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32) (result i32)))
    (table 2 funcref)
    (func (type 1)
      (i32.const 0)
      (call_indirect (type 1) (i32.const 1))
    )
  )
  "type mismatch"
)
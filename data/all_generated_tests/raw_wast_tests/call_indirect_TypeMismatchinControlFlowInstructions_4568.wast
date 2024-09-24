;; 7. **Boundary Condition with Empty Table and Mismatched Function Signatures:**    - Check responses when `call_indirect` is used on an empty table or a table that has functions with mismatched signatures. Verify correct trapping behavior due to boundary conditions and type mismatch.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $empty-table-mismatch-sig 
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "element out of bounds"
)
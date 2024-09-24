;; 8. **Dynamic Type Resolution in Multi-Table Context**:    - Call a function indirectly with `call_indirect` where multiple tables exist, requiring the correct table and type resolution.    - **Constraint**: Properly resolve and match function types dynamically within a multi-table context.    - **Relation**: Validates dynamic type checking efficiency and correct control flow adherence according to function tables.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func (call_indirect (type 1) (i32.const 1)))
  )
  "type mismatch"
)
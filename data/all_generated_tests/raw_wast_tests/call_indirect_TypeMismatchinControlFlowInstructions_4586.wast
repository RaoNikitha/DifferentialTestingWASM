;; 5. **Out of Bound Table Index Access**:    - Use `call_indirect` with an index exceeding the table bounds.    - **Constraint**: Ensures valid index range checks for the function table.    - **Relation**: Checks for correct traps when accessing out-of-bound indexes, ensuring proper type-based control flow.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func (result i32)
      (call_indirect (type 0) (i32.const 2))
    )
  )
  "index out of bounds"
)
;; 9. **Mismatched Return Types**: Invoke a function indirectly expecting a different return type than the one provided by the actual function in the table.    - **Constraint**: Function return type mismatch.    - **CFG Relation**: Validates CFG’s handling of stack and return type conformity, ensuring traps are executed upon mismatches.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (result f64)))
    (table 1 funcref)
    (func $mismatched-return-type (result i32)
      (call_indirect (type 1) (i32.const 0))
    )
  )
  "type mismatch"
)
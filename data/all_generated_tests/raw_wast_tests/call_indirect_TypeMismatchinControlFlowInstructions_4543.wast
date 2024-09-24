;; 2. **Test Description**: Create a table with multiple function references of varying types, then use `call_indirect` to index a function expecting a result type `i32`, but the indirectly called function returns an `f64`.    - **Constraint**: Verifies that a mismatch in result types of function references and the actual called type results in a trap.    - **Relation**: Validates type conformity in control flow, ensuring traps occur on type mismatches.

(assert_invalid
  (module
    (type $sig_i (func (result i32)))
    (type $sig_f (func (result f64)))
    (table funcref (elem $f))
    (func $f (result f64) (f64.const 0.0))
    (func $test 
      (i32.const 0)
      (call_indirect (type $sig_i) (i32.const 0))
    )
  )
  "type mismatch"
)
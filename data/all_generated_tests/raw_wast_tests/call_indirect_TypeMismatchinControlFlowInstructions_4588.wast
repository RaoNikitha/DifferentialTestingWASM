;; 7. **Mismatch in Polymorphic Call Arguments**:    - Test a scenario where the function signature allows for multiple valid types but `call_indirect` provides invalidly typed arguments.    - **Constraint**: All possible polymorphism must conform to type requirements.    - **Relation**: Ensures polymorphic call scenarios are correctly type-checked in control flow.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $f (param i64) (result i64) (i64.const 0))
    (table funcref (elem $f))
    (func $mismatch-polymorphic-call
      (call_indirect (type 0) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)
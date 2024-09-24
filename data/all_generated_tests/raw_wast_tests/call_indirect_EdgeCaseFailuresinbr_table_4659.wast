;; 8. **Function Type Mismatch**:    - Test a `call_indirect` with a function type that does not match the expected parameters or return type, ensuring it traps appropriately.    - This addresses dynamic type checking during runtime for all relevant function calls.    - It relates to `br_table` by ensuring type conformity in dynamic branching scenarios.

(assert_invalid
  (module
    (func $f (param i32) (result i64))
    (type $sig (func (param i64) (result i32)))
    (table funcref (elem $f))
    (func
      (call_indirect (type $sig) (i32.const 0) (i64.const 42))
    )
  )
  "type mismatch"
)
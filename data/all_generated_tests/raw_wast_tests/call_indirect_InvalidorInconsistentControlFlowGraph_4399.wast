;; Test 8: Function Returning Different Types - **Constraint/Issue**: Evaluates function’s return value type conformity. - **Test Description**: A setup where a function returns types that do not match the expected types `t_2*` from the function signature. Execute `call_indirect` leading to a trap due to result type mismatch.

(assert_invalid
  (module
    (type $t1 (func (param i32) (result f64)))
    (type $t2 (func (param i32) (result i32)))
    (func $f1 (param i32) (result f64) (f64.const 1.0))
    (table funcref (elem $f1))
    (func $test
      (call_indirect (type $t2) (i32.const 0))
    )
  )
  "type mismatch"
)
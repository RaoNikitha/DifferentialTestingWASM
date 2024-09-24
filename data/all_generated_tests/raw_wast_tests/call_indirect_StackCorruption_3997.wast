;; 6. **Recursive Call with Type Mismatch**:    - Perform a `call_indirect` where the function being called recursively has a mismatched type or arguments. Stack should track recursive invocations accurately; any discrepancy can lead to visible stack corruption.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $wrong_type_func)
    (func $wrong_type_func (param i32))
    (func $caller_func
      (i32.const 0)
      (call_indirect (type 0))
    )
  )
  "type mismatch"
)
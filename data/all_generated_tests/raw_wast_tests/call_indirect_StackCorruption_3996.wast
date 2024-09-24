;; 5. **Table Type Mismatch**:    - Design a test where the table contains elements that are not of `funcref` type but attempt a `call_indirect`. The improper table type might not be checked correctly by one implementation, leading to stack misbehaviour.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 externref)
    (func $invalid-table-type
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)
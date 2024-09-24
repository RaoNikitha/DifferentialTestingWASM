;; 6. **Test Description**:    Table of Incorrect Reference Type:    - Constraint: Verify table type as `funcref` within `call_indirect` in looping structure.    - Test Behavior: Implement a loop calling `call_indirect` with a table type other than `funcref`, expecting a type error trap.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 externref)
    (func $incorrect-ref-type
      (loop $loop
        (call_indirect (type 0) (i32.const 0))
        (br $loop)
      )
    )
  )
  "type mismatch"
)
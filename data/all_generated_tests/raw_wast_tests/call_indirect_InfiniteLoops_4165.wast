;; 4. **Test Description**:    Function Type Mismatch in Nested Loops:    - Constraint: Validate function type conformity in nested loops using `call_indirect`.    - Test Behavior: Use nested loops where an indirect function call has parameter and return type mismatches, should trap correctly.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem 0))
    (func $f (param i32) (result i64))
    (func (param i32) (result i32)
      (loop
        (loop
          (block
            (call_indirect (type $sig) (i32.const 0) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)
;; 2. **Test Description**:    Invalid Table Index in Infinite Loop:    - Constraint: Check for proper error on out-of-bounds table index.    - Test Behavior: Implement a loop where `call_indirect` accesses a table index out of bounds, should trap and not result in an infinite loop.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $out_of_bounds
      (loop
        (call_indirect (type 0) (i32.const 100)) ; this index is out of bounds
        (br 0)
      )
    )
  )
  "out of bounds table index"
)
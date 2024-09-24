;; 4. **Test Description**: Trigger `call_indirect` with an integer index just one above the largest valid index, expecting a trap.    - **Constraint Checked**: Tests out-of-bounds index handling for `call_indirect`.    - **Relation to `br_table` Edge Case**: Validates proper handling of indices exceeding the maximum boundary, similar to `br_table` target bounds.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $trigger-oob-indirect-call
      (call_indirect (type $sig) (i32.const 1))
    )
  )
  "call indirect index out of bounds"
)
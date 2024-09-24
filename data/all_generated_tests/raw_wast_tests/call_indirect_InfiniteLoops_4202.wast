;; 1. **Test Description**: Validate `call_indirect` handling within a `loop` where an invalid type index results in a trap, ensuring proper dynamic type checking and loop exit.    - *Constraint Checked*: Proper trapping behavior on type index mismatch.    - *Infinite Loop Context*: Ensure that the `call_indirect` aborts the loop due to a trap.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $type-invalid-in-loop
      (loop
        (call_indirect (type 1) (i32.const 0))
      )
    )
  )
  "unknown type"
)
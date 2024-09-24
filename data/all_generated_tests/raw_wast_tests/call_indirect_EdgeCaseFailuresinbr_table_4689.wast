;; 8. **Invalid Target Type**:    Include an invalid type in the list of targets for `br_table` to test type conformity and ensure the implementation traps on type mismatches.

(assert_invalid
  (module
    (func $f (param i32) (result i32))
    (type $sig (func (param i32) (result i32)))
    (type $invalid (func (param f32) (result i32)))
    (table 1 funcref (elem $f))
    (func (result i32)
      (call_indirect (type $invalid) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)
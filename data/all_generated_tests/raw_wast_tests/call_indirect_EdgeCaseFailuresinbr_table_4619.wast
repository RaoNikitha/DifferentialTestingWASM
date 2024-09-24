;; 8. **Test Description**: Use a `br_table` where the table index provided is a float instead of an integer. This tests improper handling of non-integer table indexes.    - **Constraint**: Use a floating-point number as the table index.    - **Edge Case Relation**: Ensures type consistency and appropriate error handling for non-integer indices.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem))
    (func (result i32)
      (call_indirect (type $sig) (f32.const 0.0))
    )
  )
  "type mismatch"
)
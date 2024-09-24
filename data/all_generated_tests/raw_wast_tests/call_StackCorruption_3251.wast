;; 10. **Test Description**: Call a function with complex return type and multiple return values.     - **Constraint**: Validates correct handling and stacking of multiple return values.     - **Relation to Stack Corruption**: Ensures return values are neatly pushed onto the stack without causing corruption or misalignment of stack elements.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32 f64)))
    (func $complex-return-type (param i32 i32) (result i32 f64)
      (local.get 0)
      (i32.const 42)
      (f64.const 3.14)
    )
    (func (call $complex-return-type (i32.const 1) (i32.const 2)))
  )
  "type mismatch"
)
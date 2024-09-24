;; 2. **Test with Undefined Function Type Call**:     - **Description**: Call a function where the type signature (inputs and outputs) is not correctly defined or does not match the expected signature.     - **Constraint Checked**: Ensures that function types are matched and validated correctly.     - **CFG Relation**: Examines how the CFG processes mismatched function signatures, potentially leading to invalid branches or faulty type checking.

(assert_invalid
  (module
    (type $correct_sig (func (param i32) (result i32)))
    (type $wrong_sig (func (param i64) (result f32)))
    (func $test_func (type $correct_sig) (i32.const 42))
    (func (param i32) (result i32)
      (call $test_func (i32.const 42))
    )
  )
  "type mismatch"
)
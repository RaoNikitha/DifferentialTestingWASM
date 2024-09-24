;; 6. **Test with Mixed-Type Stack Arguments**:    - **Description**: Populate the stack with mixed types before calling functions via `br_table` targets.    - **Constraint Checked**: Type validation and argument transfer.    - **Edge Case Relation**: Checks if mixed types are correctly detected and managed during function calls.

(assert_invalid
  (module
    (type $sig (func (param i32 f32)))
    (func $mixed-stack
      (i32.const 5)
      (f32.const 3.14)
      (call $sig)
    )
  )
  "type mismatch"
)
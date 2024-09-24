;; 2. **Test Description**:    - Test a `call_indirect` instruction where the function table index is within bounds, but the expected function type specifies a float parameter while the available function accepts an integer parameter. This should trigger a trap due to parameter type mismatch.    - **Constraint Being Checked**:      - Correct table indexing and runtime type verification for function parameters.    - **Relation to Control Flow Instructions**:      - Ensures that the operand stack used by control flow instructions correctly matches the function signature requirements.

(assert_invalid
  (module
    (type $expected (func (param f32)))
    (func $actual (param i32))
    (table funcref (elem $actual))
    (func $test
      (call_indirect (type $expected) (i32.const 0) (f32.const 0.0))
    )
  )
  "type mismatch"
)
;; 9. **Test 9: Operand Underflow in Deeply Nested Indirect Calls**:    - **Description**: Create deeply nested `call_indirect` invocations where inner calls intentionally cause operand underflows.    - **Constraint Checked**: Ensures robustness in handling deeply nested calls and operand stack constraints.    - **CFG Relation**: Tests the CFG's depth handling and correctness in managing operand flows through multiple nested levels.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32)
      (call_indirect (type 0) (call_indirect (type 1) (i32.const 0) (i32.const 1)) (i32.const 0))
    )
  )
  "type mismatch or operand stack underflow"
)
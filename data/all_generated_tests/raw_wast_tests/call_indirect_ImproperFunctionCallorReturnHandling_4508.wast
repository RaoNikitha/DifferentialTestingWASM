;; 7. **Test Description**: Test calling functions indirectly by passing incorrect operand types in various sequences.    **Constraint Checked**: Verifies that operand type conformity is correctly enforced.    **Relation to Improper Handling**: Ensures that improper operand handling results in traps, preventing incorrect function calls.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $incorrect-operands
      (call_indirect (type 0) (f64.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)
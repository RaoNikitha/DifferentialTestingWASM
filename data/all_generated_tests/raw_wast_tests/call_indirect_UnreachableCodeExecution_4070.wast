;; 9. **Test Unreachable on Function Type Mismatch with Return Values**:    - **Description**: Execute call_indirect that expects a function returning values but references a function which does not return values, and includes an 'unreachable' instruction.    - **Constraint Checked**: Check proper handling of return type mismatches.    - **Relation to Unreachable**: Ensure the mismatch correctly traps without reaching 'unreachable'.

(assert_invalid
  (module
    (type (func (result i32)))
    (table 0 funcref)
    (func $func-return-vs-void (unreachable) (call_indirect (type 0) (i32.const 0)))
    (func (type 0) (i32.const 42))
  )
  "type mismatch"
)
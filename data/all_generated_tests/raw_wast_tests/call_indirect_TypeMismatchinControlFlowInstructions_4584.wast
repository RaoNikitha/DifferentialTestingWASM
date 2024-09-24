;; 3. **Mismatched Function Signature Length**:    - Test a `call_indirect` instruction where the function in the table expects two arguments, but the call site provides only one.    - **Constraint**: The number of arguments provided must exactly match the function signature length.    - **Relation**: Ensures that function signature length constraints are correctly enforced in control flow.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $mismatched-argument-length
      (i32.const 0)
      (i32.const 1)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)
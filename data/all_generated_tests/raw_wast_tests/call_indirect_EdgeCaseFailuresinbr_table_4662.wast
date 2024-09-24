;; 1. **Test Description**: Validate behavior when the `call_indirect` instruction references a function type that requires more parameters than provided on the operand stack.    - **Constraint Checked**: Ensures the `call_indirect` instruction properly traps if the operand stack lacks required parameters.    - **Relation to `br_table` Edge Case**: Simulates a boundary check on operand sufficiency, similar to index validity for `br_table`.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $insufficient-params
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)
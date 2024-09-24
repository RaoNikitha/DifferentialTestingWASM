;; 4. **Test Description**:    Create a scenario where `call_indirect` is supposed to call a function correctly but the table index operand is mixed up, and the caller function ends with an `unreachable` instruction.    - **Constraint Checked**: Operand stack type checking.    - **Relation to Unreachable Code Execution**: Operand type mismatch should trap before reaching the `unreachable` instruction.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $f1 (param i32) (unreachable))
    (func $f2 (call_indirect (type 1) (i32.const 0)))
  )
  "type mismatch"
)
;; 1. **Unreachable After Type Mismatch Trap**:    - Test to check if the `call_indirect` correctly traps on type mismatch between the function in the table and the expected function type, and subsequently hits the `unreachable` instruction.    - This ensures the control flow correctly triggers the trap before reaching code paths marked as `unreachable`.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 0 funcref)
    (func $type-mismatch-trap (call_indirect (type $sig) (i32.const 0) (i32.const 42)))
    (unreachable)
  )
  "type mismatch"
)
;; 4. **Incorrect Operand Count with Valid Table Index**:    - Execute a `call_indirect` instruction with the correct table index but incorrect count of arguments in the operand stack.    - Checks for: Proper handling of operand count and branch target validation.

(assert_invalid
  (module
    (type $sig (func (param i32 i32)))
    (table 1 funcref)
    (func (call_indirect (type $sig) (i32.const 0) (i32.const 1)))
  )
  "type mismatch"
)
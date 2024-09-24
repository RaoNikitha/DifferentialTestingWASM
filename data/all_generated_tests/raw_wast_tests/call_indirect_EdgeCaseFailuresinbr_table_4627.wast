;; 6. **Incorrect Operand Count**:    Formulate a `call_indirect` instruction where the operand stack does not have enough elements as required by the function signature. This verifies if operand stack underflows are caught. In `br_table`, there must be enough indices to branch correctly without underflow.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (func $f (param i32 i32) (result i32) (i32.const 42))
    (elem (i32.const 0) $f)
    (func $test (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
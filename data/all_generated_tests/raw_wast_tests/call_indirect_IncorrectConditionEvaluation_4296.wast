;; 5. Evaluate the `call_indirect` instruction trapping behavior when the operand stack does not have sufficient arguments required by the callee function, ensuring correct detection of operand stack underflow.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
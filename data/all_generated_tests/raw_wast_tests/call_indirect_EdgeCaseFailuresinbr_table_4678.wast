;; 7. A `br_table` instruction with a non-numeric (e.g., a string or character) operand, testing the type-checking mechanisms of the operand handlings, ensuring improper types lead to an immediate trap.

(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(table 1 funcref)"
    "(func (result i32)"
    "  (call_indirect (type $sig) (result i32) (i32.const \"string_operand\"))"
    ")"
  )
  "unexpected string operand"
)
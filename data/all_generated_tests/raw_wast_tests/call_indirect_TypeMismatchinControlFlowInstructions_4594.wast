;; 3. Design a `call_indirect` instruction indexed to a function requiring two `i32` parameters but provide only one parameter on the stack when invoking the instruction. This checks for operand stack sufficiency.

(assert_invalid
 (module
  (type (func (param i32 i32)))
  (table funcref (elem 0))
  (func (call_indirect (type 0) (i32.const 0)))
 )
 "type mismatch"
)
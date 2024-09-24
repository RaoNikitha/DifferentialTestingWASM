;; 4. **Invalid Operand Stack**:     Create a `call_indirect` instruction where the operand stack does not have enough parameters to match the function signature. Validate the trapping mechanism and verify the final stack state is as expected, with no corruption.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32) (result i32) (i32.add (local.get 0) (local.get 0)))
    (func $not-enough-params (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
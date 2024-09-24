;; 1. Test with a `call_indirect` instruction where the operand stack initially contains fewer elements than required by the function signature, ensuring it leads to an underflow and verifies proper trapping behavior or stack corruption.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32))
    (func $test
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "operand stack underflow"
)
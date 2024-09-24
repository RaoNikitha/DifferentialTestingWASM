;; 3. Test a nested `call_indirect` instruction where a valid function calls another function through `call_indirect`, ensuring proper operand stack handling through multiple levels of indirect calls.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32) (result i32)))
    (func $func1 (param i32) (result i32)
      (call_indirect (type $sig2) (local.get 0)) ; nested call_indirect
    )
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $nested_call (param i32) (result i32)
      (call_indirect (type $sig1) (local.get 0)) ; outer call_indirect
    )
  )
  "type mismatch"
)
;; 5. Test a sequence where a `call_indirect` instruction calls a function that itself uses `call_indirect` to call another function, ensuring that the operand stack and return values are correctly managed through multiple indirect calls.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (result i32)))
    (table funcref (elem $func1 $func2))
    (func $func1 (param i32) (result i32)
      (call_indirect (type $sig2) (i32.const 1))
    )
    (func $func2 (result i32)
      (i32.const 42)
    )
    (func (export "main") (param i32) (result i32)
      (call_indirect (type $sig1) (local.get 0))
    )
  )
  "type mismatch"
)
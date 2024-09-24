;; 10. Test a `call_indirect` where the index resolves to a function with a variadic signature, and ensure that the operand stack after the call correctly matches the expected results from the variadic function, ensuring accurate handling of function return types.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 i32) (result i32 i32)))
    (func $variadic-func-1 (param i32) (result i32)
      (local.get 0))
    (func $variadic-func-2 (param i32 i32) (result i32 i32)
      (local.get 0) (local.get 1))
    (table funcref (elem $variadic-func-1 $variadic-func-2))
    (func $test-call-indirect
      (result i32 i32)
      (call_indirect (type 1) (i32.const 1) (i32.const 42))
    )
  )
  "type mismatch"
)
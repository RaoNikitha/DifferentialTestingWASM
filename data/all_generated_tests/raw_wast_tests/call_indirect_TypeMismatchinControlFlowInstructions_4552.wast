;; 1. Define a WebAssembly function `f1` expecting two `i32` arguments but provide an `i64` type function instead in the table. Use `call_indirect` to invoke `f1` and check if the error is correctly trapped. The Type Mismatch should trigger due to incorrect operand type in the control flow at runtime.

(assert_invalid
  (module
    (func $f1 (param i32 i32))
    (type $sig (func (param i32 i32)))
    (type $wrong_sig (func (param i64)))
    (table funcref (elem $f1))
    (func $test (call_indirect (type $wrong_sig) (i32.const 0) (i64.const 0)))
  )
  "type mismatch"
)
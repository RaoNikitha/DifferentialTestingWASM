;; 9. Construct a WebAssembly function `f6` expecting an `i32` input but provide a type index expecting an `i64` input. Use `call_indirect` and idex `f6`. The mismatch should trigger a type mismatch trap due to operand stack type mismatches.

(assert_invalid
  (module
    (type $i64_param_type (func (param i64)))
    (func $f6 (param i32))
    (table 1 funcref (elem $f6))
    (func (export "test")
      (i32.const 0)
      (call_indirect (type $i64_param_type) (i32.const 0))
    )
  )
  "type mismatch"
)
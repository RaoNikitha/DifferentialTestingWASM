;; 6. Design a sequence where `call_indirect` is invoked with a valid index, but the operand stack has mismatched types. This checks the implementation’s capability to trap on stack type mismatches.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $stack-type-mismatch
      (call_indirect (type 0) (i32.const 1) (f64.const 1.0))
    )
  )
  "type mismatch"
)
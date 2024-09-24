;; 7. Evaluate `call_indirect` for an indirect call to an exported function that internally performs another indirect call, ensuring nested module transitions are managed without stack corruption or control flow issues.

(assert_invalid
  (module
    (type $sig_i (func (param i32) (result i32)))
    (type $sig_v (func (param i32)))
    (func $nested_call (param i32)
      (call_indirect (type $sig_v) (i32.const 0))
    )
    (func (export "start") (param i32) (result i32)
      (call_indirect (type $sig_i) (i32.const 0))
    )
    (table 1 funcref)
    (elem (i32.const 0) $nested_call)
  )
  "type mismatch"
)
;; - Test 9: Execute a function via `call_indirect` that expects a different order of types (e.g., integer followed by float), but provide arguments in the wrong order (float first, then integer). Ensure detection of type mismatch and trap behavior to prevent incorrect stack behavior and corruption.

(assert_invalid
  (module
    (type $sig (func (param i32 f64) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32 f64) (result i32)
      local.get 0
    )
    (func
      (call_indirect (type $sig) (i32.const 0) (f64.const 1.0) (i32.const 42))
    )
  )
  "type mismatch"
)
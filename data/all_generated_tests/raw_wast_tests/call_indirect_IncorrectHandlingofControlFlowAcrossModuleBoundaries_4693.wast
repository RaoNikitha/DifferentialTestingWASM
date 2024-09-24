;; - **Test 2**: Create a WASM module with an exported function that calls another function via `call_indirect`. Import this module into another WASM module and call the exported function. Verify that the control flow is accurately maintained across the module boundary, and the return values are correctly propagated back to the calling module.

(assert_invalid
  (module
    (type $sig1 (func (result i32)))
    (type $sig2 (func (param f32) (result i32)))
    (import "modA" "ext_func" (func $ext_func (type $sig1)))
    (table 1 funcref)
    (elem (i32.const 0) $ext_func)
    (func $test_func
      (call_indirect (type $sig2) (i32.const 0) (f32.const 0.0))
    )
  )
  "type mismatch"
)
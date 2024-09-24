;; - **Test 8**: Define a scenario where a WASM module imports a function and then defines a function that calls this imported function via `call_indirect`. The outer function should be invoked from another module. The test checks the control flow integrity and stack stability across repeated transitions across boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external (param i32) (result i32)))
    (type $sig (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $external)
    (func $inner_func (param i32) (result i32)
      (call_indirect (type $sig) (local.get 0) (i32.const 0))
    )
    (export "inner_func" (func $inner_func))
  )
  "type mismatch"
)
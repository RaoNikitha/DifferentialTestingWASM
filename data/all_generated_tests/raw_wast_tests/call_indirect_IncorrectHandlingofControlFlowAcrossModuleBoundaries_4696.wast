;; - **Test 5**: Define two WASM modules where one imports a function that takes variadic arguments. Use `call_indirect` to call this function across the module boundary. Ensure that the variadic arguments are correctly handled and that no stack overflows occur, verifying control between module boundaries.

(assert_invalid
  (module
    (type $sig_variadic (func (param i32) (result i32)))
    (type $sig_expected (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $imported_func)
    (import "env" "imported_func" (func $imported_func (type $sig_variadic)))
    (func (param i32) (result i32)
      (call_indirect (type $sig_expected) (local.get 0) (i32.const 10) (i32.const 20))
    )
  )
  "type mismatch"
)
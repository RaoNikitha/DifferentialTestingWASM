;; - **Test 6**: Implement a WASM module that imports and immediately re-exports a function. Call this re-exported function using `call_indirect` from another module, making sure the control flow adheres to the module boundaries without losing the function context.

(assert_invalid
  (module
    (import "env" "fn" (func $fn (param i32) (result i32)))
    (export "fn" (func $fn))
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $fn)
    (func (result i32)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)
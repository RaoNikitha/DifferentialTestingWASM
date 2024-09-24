;; - **Test 1**: Define a WASM module that imports a function from another module. Use `call_indirect` to call this imported function using an index that correctly matches the function type. Ensure that the correct return values are pushed onto the operand stack in both implementations. This test checks if control flow between modules is correctly handled without any stack corruption.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (table 1 funcref)
    (type (func (param i32) (result i32)))
    (elem (i32.const 0) $external_func)
    (func $indirect_call
      (param i32)
      (result i32)
      (call_indirect (type 0) (local.get 0) (i32.const 0))
    )
  )
  "type mismatch"
)
;; Create a WebAssembly module that imports a function which itself makes an `call_indirect` call to another imported function. Validate that the operand stack's state and return values are correctly managed across multiple module boundaries and confirm that both implementations handle the function calls uniformly.

(assert_invalid
  (module
    (import "env" "indirect" (func $indirect (param i32)))
    (import "env" "target" (func $target (param i32 i32)))
    (type $sig (func (param i32 i32) (result i32)))
    (table funcref (elem $target))
    (func (param i32) (result i32)
      local.get 0
      (call $indirect)
    )
    (func (export "test") (param i32 i32) (result i32)
      local.get 0
      (call_indirect (type $sig) (local.get 1))
    )
  )
  "type mismatch"
)
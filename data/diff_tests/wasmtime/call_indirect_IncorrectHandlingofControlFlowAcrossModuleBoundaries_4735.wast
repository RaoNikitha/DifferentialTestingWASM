;; Design a scenario where a WebAssembly function imported from another module calls a function indirectly from a table using `call_indirect` and passes control back to the calling module (via return). Verify that the operand stack is managed correctly in both implementations and captures the correct results.

(assert_invalid
  (module
    (import "env" "func_sig" (func $imported_func (type 0)))
    (type (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $imported_func)
    (func $caller (param i32 i32) (result i32)
      (call_indirect (type 0) (i32.const 0) (local.get 0) (local.get 1))
    )
  )
  "imported function type mismatch"
)
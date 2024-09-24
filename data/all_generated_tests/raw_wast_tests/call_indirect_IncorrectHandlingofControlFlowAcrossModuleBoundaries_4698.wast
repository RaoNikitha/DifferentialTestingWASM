;; - **Test 7**: Have one WASM module import a function that returns multiple values. Use `call_indirect` to call this function from another module, then verify that the multiple return values are correctly managed across the module boundary and pushed appropriately onto the operand stack.

(assert_invalid
  (module
    (type $sig (func (result i32 f64)))
    (table funcref (elem $imported_func))
    (func $imported_func (import "env" "imported_func") (result i32 f64))
    (func $multiple-return
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "multiple return values handling"
)
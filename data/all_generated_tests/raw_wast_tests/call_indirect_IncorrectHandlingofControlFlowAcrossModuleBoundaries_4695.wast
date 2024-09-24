;; - **Test 4**: Create a scenario where a WASM module imports a function that throws a trap (e.g., division by zero). Use `call_indirect` to invoke this function from another module, ensuring the trap is correctly propagated back to the calling module and doesn't result in operand stack corruption.

(assert_invalid
  (module
    (import "env" "divide_by_zero" (func $d (result i32)))
    (type (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $d)
    (func $test
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "imported function trap propagation"
)
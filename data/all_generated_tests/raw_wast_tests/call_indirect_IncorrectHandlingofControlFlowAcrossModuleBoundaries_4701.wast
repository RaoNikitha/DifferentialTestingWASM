;; - **Test 10**: Establish a test where a WASM module imports several functions with different signatures. Use `call_indirect` with a dynamic index to call these functions from another module multiple times, validating that dynamic type checking and control flow across module boundaries are managed correctly, without causing errors or traps due to mismatched types.

(assert_invalid
  (module
    (import "env" "funcA" (func $funcA (param i32)))
    (import "env" "funcB" (func $funcB (param i32 i32)))
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i32 i32)))
    (table funcref (elem $funcA $funcB))
    (func $dynamic-call (param i32)
      (call_indirect (type $sig1) (local.get 0))
      (call_indirect (type $sig2) (local.get 0) (i32.const 0))
    )
  )
  "type mismatch"
)
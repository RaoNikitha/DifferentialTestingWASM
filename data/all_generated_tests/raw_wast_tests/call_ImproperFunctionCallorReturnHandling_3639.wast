;; Construct a function that attempts to call another function in an indirect manner with an invalid type index and inspect how the error messages differ between the WebAssembly implementation (expected specific error) and wizard_engine.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $invalid_function)
    (func (call_indirect (type $sig) (i32.const 0) (i32.const 1)))
    (func $invalid_function (param f64) (result i32) (i32.const 0))
  )
  "type mismatch"
)
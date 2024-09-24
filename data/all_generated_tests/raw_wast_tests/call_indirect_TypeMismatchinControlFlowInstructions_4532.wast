;; 1. **Indirect Call with Incorrect Block Result Type**:    - Description: Create a WebAssembly module with a `call_indirect` instruction inside a `block` that specifies a result type of `i32`. The indirectly called function, however, returns an `f64`. This should trigger a type mismatch in the `block` instruction's expected result.

(assert_invalid
  (module
    (type $sig_i (func (result i32)))
    (type $sig_f (func (result f64)))
    (table 1 funcref)
    (elem (i32.const 0) $func_f)
    (func $func_f (result f64)
      (f64.const 0.0)
    )
    (func (result i32)
      (block (result i32)
        (call_indirect (type $sig_f) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
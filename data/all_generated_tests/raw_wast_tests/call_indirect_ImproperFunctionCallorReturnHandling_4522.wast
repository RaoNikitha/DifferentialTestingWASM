;; 1. **Type Mismatch Trap**: Create a WASM module with a `call_indirect` instruction that references a function with a mismatched type signature from the expected type index. This should trap if type checking is handled properly.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (func $f (param i32) (result i32)
      i32.const 42)
    (table funcref (elem $f))
    (func (result i32)
      (call_indirect (type $sig2) (i32.const 0) (i32.const 5) (i32.const 10)))
  )
  "type mismatch"
)
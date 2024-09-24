;; 4. Create a WASM module where the `call_indirect` tries to invoke a function from a non-existing table index, ensuring that both implementations trap. Make sure OCaml traps due to pattern matching and table bounds check while Java fails when the signature verification `checkSignature` method returns null.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func (result i32) (i32.const 42))
    (func (call_indirect (type 0) (i32.const 1)))
  )
  "element index out of bounds"
)
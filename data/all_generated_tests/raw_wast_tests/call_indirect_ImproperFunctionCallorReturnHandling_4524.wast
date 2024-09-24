;; 3. **Empty Table Call**: Construct a WASM module where `call_indirect` attempts to call a function from an empty table. The module should trap, validating the empty table handling.

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "out of bounds table access"
)
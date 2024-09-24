;; 2. **Out-of-Bounds Table Indexing**:    Create a WebAssembly module where a `call_indirect` instruction uses an index outside the bounds of the table. Verify that the execution does not reach an `unreachable` instruction unless the out-of-bounds indexing is detected and properly trapped. This examines boundary checking robustness.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $out_of_bounds (call_indirect (type 0) (i32.const 5)))
  )
  "out of bounds table access"
)
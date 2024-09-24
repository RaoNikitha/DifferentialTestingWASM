;; 1. **Test Description**:    - Provide a WebAssembly module with a `call_indirect` instruction pointing to a defined table, but with an index value that falls outside the valid range of the table.    - **Constraint**: Checks for proper boundary check and trap condition when the table index is out of bounds.    - **CFG Relation**: Ensures CFG correctly identifies the invalid indexing leading to an unreachable path and hence a trap.

(assert_invalid
  (module
    (type (func (result i32)))
    (table 1 funcref)
    (func $out-of-bounds (call_indirect (type 0) (i32.const 2)))
  )
  "out of bounds table index"
)
;; 2. **Out-of-Bounds Table Index Test**:    - **Description**: Use a `call_indirect` instruction with an operand indexing outside the bounds of an available table.    - **Constraint**: Validates that out-of-bounds indexing results in a trap.    - **CFG Relation**: Verifies that the CFG correctly handles invalid table indexing paths, resulting in an accurate trap condition instead of continuing execution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32)
      local.get 0)
    (func (result i32)
      call_indirect (type 0) (i32.const 2))
  )
  "out of bounds table index"
)
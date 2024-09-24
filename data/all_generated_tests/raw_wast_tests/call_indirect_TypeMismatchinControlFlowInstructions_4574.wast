;; 3. **Function Type Mismatch - Control Block Exit**:     - Embed the `call_indirect` instruction within a `block` and ensure the type does not match on exit.     - **Constraint**: Function results must match block’s result types.     - **Test Relation**: Tests whether implementations correctly handle type mismatches when exiting blocks.

(assert_invalid
  (module
    (type (func (param i32) (result i64)))
    (table 0 funcref)
    (func
      (block (result i32)
        (call_indirect (type 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
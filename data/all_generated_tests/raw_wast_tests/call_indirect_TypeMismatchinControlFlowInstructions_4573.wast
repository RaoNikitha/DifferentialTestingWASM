;; 2. **Function Type Mismatch - Control Block Entry**:     - Embed the `call_indirect` instruction within a `block` and ensure the type does not match.     - **Constraint**: Result of the block must match the expected type if it contains `call_indirect`.     - **Test Relation**: Checks proper type checking when transitioning control flow into a block containing `call_indirect`.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table funcref (elem $f))
    (func $f (param i32 i32))
    (func $type-mismatch-control-block
      (block (result i64)
        (call_indirect (type 0) (i32.const 0) (i32.const 1) (i32.const 2))
      )
    )
  )
  "type mismatch"
)
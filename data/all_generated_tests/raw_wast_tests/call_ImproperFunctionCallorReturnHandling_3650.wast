;; 9. **Test Description**: Execute a `call_indirect` instruction with erroneous type indices, verifying accurate type checking and indirect table lookups.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 0 funcref)
    (func $f (param i32))
    (func $type-first-empty-in-block
      (block
        (call_indirect (type 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
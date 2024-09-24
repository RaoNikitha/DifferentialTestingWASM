;; 1. **Null Table Entry Access**:     Create a `call_indirect` instruction that tries to access an entry in a table which is set to null. Verify if both implementations correctly trap due to the invalid function reference and check for stack integrity post error handling.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) (; null ;))
    (func (result i32)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "null table entry access"
)
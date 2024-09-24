;; 8. **Dynamic Resolution to Null**:    Use a `call_indirect` instruction where the dynamically resolved function index refers to a null entry in the table. This checks if null references are correctly handled. `br_table` should handle null or invalid branches appropriately to avoid runtime errors.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $null-entry (result i32)
      (call_indirect (type 0) (i32.const 1)))
  )
  "type mismatch"
)
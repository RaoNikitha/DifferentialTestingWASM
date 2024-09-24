;; 7. **Non-`funcref` Table Type Check**:    Create a module where the table referenced by `call_indirect` contains non-`funcref` elements. Ensure that execution hits an `unreachable` instruction, implicating correct type enforcement on table elements.

(assert_invalid
  (module
    (type (func (result i32)))
    (table 10 anyref)
    (func $invalid-table-type (call_indirect (type 0) (i32.const 0)))
  )
  "incompatible table type"
)
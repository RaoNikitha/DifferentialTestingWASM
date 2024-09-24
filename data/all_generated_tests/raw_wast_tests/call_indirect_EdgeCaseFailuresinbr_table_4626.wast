;; 5. **Empty Table Reference**:    Use a `call_indirect` instruction to reference an empty table. This test ensures that both implementations handle empty tables correctly, preventing invalid accesses. Similar checks are crucial for `br_table` to avoid branching to non-existent indexes.

(assert_invalid
  (module
    (type (func (result i32)))
    (table 0 funcref)
    (func (result i32)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "element segment does not fit"
)
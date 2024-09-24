;; 1. **Invalid Table Index**:    Create a test where the `call_indirect` instruction uses a table index that does not exist in the context. This will check if the handling of invalid table indices yields the correct traps in both implementations. This is closely related to edge case failures in `br_table` where invalid indices can cause undefined behavior.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $invalid-table-index
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "table index out of bounds"
)
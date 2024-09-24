;; 9. **Empty Function Table**:    - Test executing `call_indirect` with a table that has no entries.    - Constraint Check: Confirm trap behavior and stack integrity on empty tables.    - Stack Corruption Relation: Call on non-existent function should trap and not corrupt the stack by attempting invalid reads.

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $empty-table-test (call_indirect (type 0) (i32.const 0)))
  )
  "out of bounds table access"
)
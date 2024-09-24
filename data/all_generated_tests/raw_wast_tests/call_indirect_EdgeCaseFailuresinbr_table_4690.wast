;; 9. **Sparse Target Table**:    Use a sparse table where some entries are undefined and check if the `br_table` instruction correctly traps when an undefined target is accessed.

(assert_invalid
 (module
  (type (func (param i32)))
  (table 2 funcref)
  (elem (i32.const 1) $func1)
  (func $func1 (param i32) (result i32)
    (local.get 0)
  )
  (func $test (result i32)
    (call_indirect (type 0) (i32.const 0) (i32.const 10))
  )
 )
 "table element not initialized"
)
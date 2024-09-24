;; 6. **Multiple Function Types**: Devise a test with multiple tables and functions of different types. Ensure the `call_indirect` properly selects and validates the correct function type from the specified table and index.

(assert_invalid
  (module
    (type $type1 (func (param i32) (result i32)))
    (type $type2 (func (param i64) (result i64)))
    (func $func1 (param i32) (result i32)
      local.get 0
    )
    (func $func2 (param i64) (result i64)
      local.get 0
    )
    (table $table1 1 funcref)
    (table $table2 1 funcref)
    (elem (i32.const 0) $func1)
    (elem (table $table2 (i32.const 0)) $func2)
    (func (param i32)
      (call_indirect (type $type2) (local.get 0))
    )
  )
  "type mismatch"
)
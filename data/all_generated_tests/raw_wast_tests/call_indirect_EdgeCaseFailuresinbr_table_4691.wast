;; 10. **Polymorphic Entries**:    Provide polymorphic entries with different valid function types to `br_table` to ensure consistent and correct dynamic resolution and proper trap behavior if needed.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i64)))
    (table 1 funcref)
    (elem (i32.const 0) (ref.func $function_0))
    (func $function_0 (type 0) (param i32) (result i32)
      i32.const 1
    )
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
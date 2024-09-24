;; 8. **Test Description**:    Create a scenario where `call_indirect` points to a table entry with a type index that dynamically changes throughout module execution. Validate that stack integrity is maintained despite dynamic type resolution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i64)))
    (table 2 funcref)
    (elem (i32.const 0) func 0)
    (func $type-mismatch-indirect (param i64) (result i64)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)
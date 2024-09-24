;; 4. **Test Description**: Define a function type that returns multiple values, add it to a table, and call it indirectly with a function expecting a single return value.    **Constraint Checked**: Ensures return value types are properly verified.    **Relation to Improper Handling**: Verifies that return type mismatches do not lead to incorrect function returns.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32) (result i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func $func (type 0))
    (func (call_indirect (type 0) (i32.const 0) (i32.const 1)))
  )
  "type mismatch"
)
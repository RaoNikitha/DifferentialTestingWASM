;; 6. **Test Description**: Invoke `call_indirect` with a mismatched function signature having more return values than expected, confirming a trap.    - **Constraint Checked**: Validates enforcement of exact type match in function signatures.    - **Relation to `br_table` Edge Case**: Tests similar type match constraints as those in `br_table`.

(assert_invalid
  (module
    (type (func (param i32) (result i32 i32)))
    (table 0 funcref)
    (func $return-mismatch (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
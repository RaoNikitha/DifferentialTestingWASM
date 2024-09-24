;; 5. **Test Description**: Perform a `call_indirect` where the targeted function signature has fewer return values than expected, verifying a type mismatch trap.    - **Constraint Checked**: Ensures proper type checking and trapping for mismatched function signatures.    - **Relation to `br_table` Edge Case**: Checks type conformity issues, akin to the type checks in `br_table`.

(assert_invalid
  (module
    (type (func (param i32) (result i32 i32)))
    (func $test-func (param i32) (result i32) (i32.const 42))
    (table (export "table") 1 funcref)
    (elem (i32.const 0) $test-func)
    (func (param i32)
      (call_indirect (type 0) (local.get 0))
    )
  )
  "type mismatch"
)
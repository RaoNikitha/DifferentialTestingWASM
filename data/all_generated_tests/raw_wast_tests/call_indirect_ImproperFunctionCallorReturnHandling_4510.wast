;; 9. **Test Description**: Create a scenario where multiple `call_indirect` instructions use the same table but different type indexes.    **Constraint Checked**: Ensures that type checks are independent and context-specific.    **Relation to Improper Handling**: Verifies that each indirect call is properly type-checked in context, avoiding wrong function calls.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i64)))
    (type $sig2 (func (param i64) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i64) (result i32) (i32.const 0))
    (func $test
      (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
      (call_indirect (type $sig2) (i32.const 0) (i64.const 0))
    )
  )
  "type mismatch"
)
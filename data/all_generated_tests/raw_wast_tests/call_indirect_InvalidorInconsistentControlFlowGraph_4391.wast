;; 10. **Test 10: Dynamic Type Mismatches During Nested Calls**:     - **Description**: Design scenarios where nested `call_indirect` instructions introduce dynamic type mismatches through nested function calls.     - **Constraint Checked**: Verifies dynamic type-checking mechanisms in deeply nested contexts.     - **CFG Relation**: Ascertain if CFG accurately reflects complex nested type-checking scenarios and manages dynamic mismatches effectively, leading to traps when expected.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32) (result i64)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32)
      (call_indirect (type $sig2) (i32.const 0))
    )
    (func $type-dynamic-mismatch-nested
      (call_indirect (type $sig1) (i32.const 0))
    )
  )
  "type mismatch"
)
;; 7. **Test 7: Nested `call_indirect` Instructions**:    Nest multiple `call_indirect` instructions within each other, ensuring correct stack usage at each level. Confirm that stack frames are correctly managed without overflows or underflows.

(assert_invalid
  (module
    (type $funcType (func (param i32) (result i32)))
    (table funcref (elem $func1))
    (func $func1 (param i32) (result i32)
      (call_indirect (type $funcType) (i32.const 0) (i32.const 0))
    )
    (func $main (param i32) (result i32)
      (call_indirect (type $funcType) (i32.const 1))
    )
  )
  "type mismatch"
)
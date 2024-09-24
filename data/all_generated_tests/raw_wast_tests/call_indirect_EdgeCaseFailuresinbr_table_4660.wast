;; 9. **Polymorphic Return Types**:    - Test a `call_indirect` with functions returning multiple or variable result types, ensuring correct return values and trapping for mismatched or undefined results.    - Ensures that all possible return types are handled correctly in memory and stack operations.    - It relates to `br_table` by confirming that result handling for indirect references conforms to expected polymorphic behaviors.

(assert_invalid
  (module
    (type $t1 (func (param i32) (result i32 i32)))
    (type $t2 (func (param i32) (result i32)))
    (func $f (param i32) (result i32 i32)
      (i32.const 1)
      (i32.const 2)
    )
    (table funcref (elem $f))
    (func (result i32 i32)
      (call_indirect (type $t1) (i32.const 0) (i32.const 0))
    )
    (func (result i32)
      (call_indirect (type $t2) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)
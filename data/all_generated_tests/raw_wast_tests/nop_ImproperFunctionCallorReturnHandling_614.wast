;; 5. **Test Description 5**:    - **Scenario**: Place a `nop` immediately after a `call_indirect` that returns multiple values.    - **Constraint Check**: Ensure that the return values correctly appear on the stack after the `nop`.    - **Relation to Improper Handling**: Ensures correct stack behavior and return value preservation during indirect calls.

(assert_invalid
  (module
    (type $type-ii (func (result i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) $type-ii)
    (func (result i32 i32)
      i32.const 42
      i32.const 43)
    (func (result i32 i32)
      (call_indirect (type $type-ii) (i32.const 0))
      nop)))
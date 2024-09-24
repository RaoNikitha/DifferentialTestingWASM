;; 5. **Test Description**: Set up a scenario where `call_indirect` indexes into a table expecting a multi-value function signature but provides a function only returning a single value of `i64`.    - **Constraint**: Ensures that expected function signatures, including multi-value, are strictly adhered to.    - **Relation**: Checks for type mismatch when control flow involves functions with multi-value returns.

(assert_invalid
  (module
    (func $singleValueFunc (result i64) (i64.const 42))
    (type $multiValueSig (func (result i64 i64)))
    (table funcref (elem $singleValueFunc))
    (func $testFunc
      (call_indirect (type $multiValueSig) (i32.const 0))
    )
  )
  "type mismatch"
)
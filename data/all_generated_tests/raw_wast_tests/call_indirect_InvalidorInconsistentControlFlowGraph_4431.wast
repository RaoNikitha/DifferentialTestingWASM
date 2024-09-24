;; 10. **Type Polymorphism Test with Multiple Valid Function Signatures**:    - **Description**: Design a test where function table entries cover all valid variants of a polymorphic function type expected by `call_indirect`.    - **Constraint**: Validates type polymorphism and multiple valid function signatures within the table.    - **CFG Relation**: Verifies CFG can represent multiple valid branches for polymorphic function calls and handles them without erroneous mismatches.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i32 i32)))
    (table 2 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $func1 (type $sig1) (param i32) (i32.const 0))
    (func $func2 (type $sig2) (param i32 i32) (i32.const 0))
    (func $test
      (call_indirect (type $sig1) (i32.const 0))
    )
  )
  "type mismatch"
)
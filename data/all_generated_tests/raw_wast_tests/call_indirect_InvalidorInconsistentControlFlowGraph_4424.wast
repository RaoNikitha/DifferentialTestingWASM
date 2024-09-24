;; 3. **Valid Function Type and Table Index Test with Multiple Valid Indices**:    - **Description**: Create a test where the table contains multiple valid function indices, and the type matches expected `typeidx`. Use various operands to call each function correctly.    - **Constraint**: Tests the proper handling of multiple valid table entries and function type conformity.    - **CFG Relation**: Ensures the CFG can navigate through various valid function calls accurately without misalignment.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32) (result i32)))
    (func $f1 (param i32))
    (func $f2 (param i32) (result i32) (i32.const 42))
    (table funcref (elem $f1 $f2))
    (func $test
      (call_indirect (type 1) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)
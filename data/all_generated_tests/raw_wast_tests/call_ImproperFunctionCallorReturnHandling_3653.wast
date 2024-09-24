;; 2. **Test Description**: Attempt to call a function using `call_indirect` with mismatched type signatures.    - **Constraint Checked**: Ensures the `call_indirect` correctly verifies the function signatures against the table's expected type.    - **Improper Handling**: Tests for failures in type checks leading to unintended function calls due to incorrect indirect table lookups.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i64)))
    (func $f (param i32) (result i32)
      (i32.const 42)
    )
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $test
      (call_indirect (type 1) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)
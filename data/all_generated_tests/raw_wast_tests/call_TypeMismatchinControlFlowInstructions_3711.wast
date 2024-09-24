;; 10. **Test 10: Nested Function Return Type Mismatch**:    - **Test Description**: Create a function that calls another function with an unintended return type in a nested structure, such as within a block or loop.    - **Constraint**: This test verifies that nested function calls respect the surrounding type constraints.    - **Type Mismatch**: Any type mismatch in nested return values should result in an error being raised.

(assert_invalid
  (module
    (func $inner (result f64) (f64.const 3.14))
    (func $outer (block (call $inner)))
  )
  "type mismatch"
)
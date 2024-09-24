;; 10. **Test 10: Nested Function Calls with Error Propagation**     - Create a test involving nested function calls where an inner function error should propagate correctly back to the outer function.     - **Specific Constraint**: Ensure that even nested calls handle errors and return appropriately rather than hitting 'unreachable' paths.     - **Test Relation**: Verifies robust error handling in nested contexts preventing the outer call from reaching 'unreachable' state due to inner function failures.

(assert_invalid
  (module
    (func $inner (param i32) (result i32)
      (unreachable)
    )
    (func $outer (param i32) (result i32)
      (call $inner (local.get 0))
    )
  )
  "unreachable"
)
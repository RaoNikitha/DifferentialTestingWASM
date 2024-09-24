;; 7. **Test 7: Incorrect Function Import Index**    - Test using an invalid or non-existent import index for the function call.    - **Specific Constraint**: Verify import index bounds and ensure robust error handling for imports.    - **Test Relation**: When import indices are not correctly handled, they may lead to 'unreachable' traps due to incorrect configurations.

(assert_invalid
  (module
    (import "env" "non_existent_func" (func $imp (param i32 i32)))
    (func (call $imp (i32.const 0) (i32.const 0)))
  )
  "unknown import"
)
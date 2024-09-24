;; 1. **Test 1: Invalid Function Index Call**:    - **Test Description**: Attempt to call a function using an index that exceeds the number of functions defined in the module.    - **Constraint**: This test checks if the error handling for out-of-bounds function indices is consistent.    - **Type Mismatch**: The incorrect index should trigger an error or trap, verifying type-related constraints on the function index.

(assert_invalid
  (module
    (func $test_function (call 5))
    (func $existing_function)
  )
  "unknown function"
)
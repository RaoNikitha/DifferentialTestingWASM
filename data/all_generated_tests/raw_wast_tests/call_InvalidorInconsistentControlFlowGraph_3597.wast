;; 6. **Test Description**:    - **Constraint Checked**: Call to Undefined Function Index    - **CFG Relevance**: Tests handling of function calls using indices outside the valid range.    - **Expected Behavior**: Should raise a trap or error for an invalid function index in both implementations but may differ in error reporting specifics.

(assert_invalid
  (module (func $test-function (call 999999999)))
  "unknown function"
)
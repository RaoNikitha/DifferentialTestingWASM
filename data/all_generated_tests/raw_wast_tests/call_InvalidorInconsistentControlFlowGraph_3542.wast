;; 1. **Test with Invalid Function Index Call**:     - **Description**: Call a function using an index that is out-of-bounds for the currently defined functions in the module.     - **Constraint Checked**: Verifies the proper validation of function indices to ensure they are within valid ranges.     - **CFG Relation**: This test ensures the CFG correctly identifies an invalid execution path when referencing an undefined function.

(assert_invalid
  (module
    (func $type-invalid-index-call
      (call 100)
    )
  )
  "function index out of bounds"
)
;; 5. **Test Description**: Implement a `br_table` where one of the indices corresponds to an invalid function index that is not present in the context function table. This tests if invalid function indices are properly handled by trapping or throwing errors.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $f (param i32))
    (func $test-br_table-invalid-index
      (block (br_table 1 (call 2)))
    )
  )
  "unknown function"
)
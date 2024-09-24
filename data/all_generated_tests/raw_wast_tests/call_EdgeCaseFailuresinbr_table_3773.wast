;; 2. **Test Description**: Construct a `br_table` with the correct number of targets but with the table index being a negative value. Test whether such an invalid case is properly trapped and reported.    - **Specific Constraint**: Verify the engine traps and reports errors for negative indices.    - **Relation to `call`**: Similar improper indexing could affect function lookup in `call`, highlighting error-handling differences.

(assert_invalid
  (module
    (func $test-func
      (i32.const -1)
      (br_table 0 1 2)
    )
  )
  "constant out of range"
)
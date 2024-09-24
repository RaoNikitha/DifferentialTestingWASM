;; 10. **Test Description**: Implement a `br_table` at the module level (global context), with an index referencing an invalid out-of-scope label, ensuring execution falls to a valid global default.     - **Constraint**: Ensures global-scoped label fallback and proper execution of the default global behavior.     - **Edge Case Relation**: Verifies the `br_table` maintains correct label resolution at the highest module hierarchy amidst invalid indices.

(assert_invalid
  (module
    (func $global-out-of-scope-label
      (block (block
        (br_table 3 0 (i32.const 0))
      ))
    )
  )
  "unknown label"
)
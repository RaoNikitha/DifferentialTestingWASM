;; 6. **Mixed Nested Blocks**:    - Develop a function with mixed nested blocks and a `br_table` targeting some inner blocks incorrectly.    - **Constraint**: Validate proper resolution of targets within nested context.    - **Edge Case**: Ensures the scoping rules for block references are honored.

(assert_invalid
  (module
    (func $mixed-nested-blocks (result i32)
      (block (result i32) 
        (block (result i32)
          (br_table 0 1 (return))
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)
;; 10. **Test Description**:     Develop a loop including a `br_table` with multiple zero value entries followed by out-of-bound entries to test non-zero defaults.     - **Constraint**: Ensures `br_table` correctly handles zero values and falls back to default for out-of-bounds.     - **Edge Case**: Verifies proper fallback and handling of mixed index types in `br_table`.

(assert_invalid 
  (module 
    (func $test-loop-br_table (result i32) 
      (loop (result i32) 
        (block $default (result i32) 
          (br_table 0 0 0 1 (br 2) $default)
        )
      (i32.const 1))
    )
  ) 
  "type mismatch"
)
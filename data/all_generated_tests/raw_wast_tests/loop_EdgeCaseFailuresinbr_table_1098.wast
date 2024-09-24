;; 9. **Test Description**:     Introduce a loop with a `br_table` containing mixed valid and out-of-bounds indices under frequently changing conditions (e.g., variable-driven indices based on loop iterations). Validate consistent default handling each time.    **Constraint**: Validate index management under frequent conditional changes.    **Relation to `br_table` Edge Cases**: Tests reliable defaulting with high variability in branching indices.

(assert_invalid
  (module
    (func $br_table_mixed_indices
      (local $i i32)
      (i32.const 0)
      (loop (result i32)
        (local.set $i)
        (local.get $i)
        (br_table 0 1 2)
        (i32.const 0)
        (br_table 2)
      )
    )
  )
  "invalid branch index"
)
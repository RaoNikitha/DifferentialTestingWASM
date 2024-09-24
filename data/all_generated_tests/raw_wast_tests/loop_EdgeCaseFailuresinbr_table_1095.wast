;; 6. **Test Description**:     Implement a loop consisting of a `br_table` inside a deeply nested series of blocks to stress-test the label stack’s management and ensure the default branch is appropriately used for out-of-range indices.    **Constraint**: Validate deep nesting’s impact on out-of-range index handling.    **Relation to `br_table` Edge Cases**: Examines handling of complex nesting and label lookups for correctness.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block
        (block
          (block
            (block
              (loop
                (br_table 0 1 2 3 4 (i32.const 5))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
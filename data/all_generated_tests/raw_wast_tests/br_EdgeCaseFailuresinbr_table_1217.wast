;; 8. **Test Description**: Design a `br_table` that includes both forward and backward branch indices and include an index too far forward to test the proper default label fallback.    - **Constraint**: Verifies correct handling for mixed forward/backward indices with proper fallback on out-of-range forward indices.    - **Edge Case Relation**: Ensures robust behavior around mixed valid/invalid branching directions.

(assert_invalid
  (module
    (func $mixed-br-table
      (result i32)
      (block $b0
        (block $b1
          (block $b2
            (br_table 0 1 2 5 (i32.const 3)) ; 5 is out-of-range
            (i32.const 42)
          )
        )
      )
    )
  )
  "unknown label"
)
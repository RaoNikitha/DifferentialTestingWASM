;; 4. **Test for `br_table` with Mixed Valid and Invalid Indices**:    - A `br_table` inside a block with both valid and invalid (out-of-bounds) indices.    - *Constraint*: Checks mixed index handling within a `br_table`.    - *Relation*: Tests label management and correct execution based on both valid and out-of-bounds indices, ensuring no stack corruption.

(assert_invalid
  (module (func $mixed-br_table 
    (block (result i32)
      (i32.const 1)
      (block
        (br_table 0 1 2 (i32.const 0))
        (br-table 0 1 0 (i32.const 1))
      )
      (i32.const 2)
    )
  ))
  "out-of-bounds label index"
)
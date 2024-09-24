;; 3. **Test Case 3**: A `br_table` instruction where all targets point to nested `loop` blocks.    - **Constraint**: Verifying if `br_table` can correctly branch to multiple nested loops.    - **Relation to br_table Edge Case**: Checks for correct indexing and targeting within complex loop nesting.

(assert_invalid
  (module 
    (func $complex_br_table_in_nested_loops
      (block
        (loop (result i32)
          (i32.const 0)
          (i32.const 1)
          (br_table 0 1 2 3) 
        )
        (loop (result i32)
          (i32.const 2)
          (i32.const 3)
          (br_table 0 1 2 3) 
        )
        (loop (result i32)
          (i32.const 4)
          (i32.const 5)
          (br_table 0 1 2 3) 
        )
      )
    )
  )
  "type mismatch"
)
;; 5. **Test Description**:    - Create a loop where the `br_table` uses a dynamic index based on stack manipulation (e.g., using `pop` from the stack). The test will manually set the index to be out-of-bounds and ensure the fallback to default.    - **Constraint Checked**: Proper handling of dynamic indexes and fallback to default for `br_table` in a loop.

(assert_invalid
  (module
    (func $br_table_out_of_bounds
      (block
        (i32.const 2) 
        (loop 
          (br_table 0 1 (i32.const 10)) 
        )
      )
    )
  )
  "index out of bounds"
)
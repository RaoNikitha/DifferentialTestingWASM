;; 6. **Test Description**:    - Design a loop with multiple `br_table` instructions, each with different out-of-bounds indices to verify consistent handling of fallback to default cases under various scenarios.    - **Constraint Checked**: Consistent handling of multiple out-of-bounds indices in `br_table` within a loop.

(assert_invalid
  (module
    (func $br_table_out_of_bounds
      (loop $loop_block
        (block $exit_block
          (block $default_block
            (br_table $loop_block $exit_block $default_block (i32.const 3))
            (br_table $loop_block $exit_block $default_block (i32.const 4))
            (br_table $loop_block $exit_block $default_block (i32.const 5))
          )
        )
      )
    )
  )
  "index out of bounds"
)
;; 5. **Test Description**: Craft a `block` with mixed `br` and `br_table` instructions, including a `br_table` that targets an out-of-bounds index first and then valid indices.    - **Constraint**: The `br_table` should correctly handle invalid first without crashing and then proceed to handle valid indices in subsequent instructions.    - **Edge Case**: Mixed branch scenarios to check for any handling issues when transitioning between invalid and valid branches.

(assert_invalid
  (module
    (func $br_table_out_of_bounds
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (i32.const 0)
          (br_table 3 0 1 2)
          (i32.const 42)
        )
      )
    )
  )
  "br_table targets index out of bounds"
)
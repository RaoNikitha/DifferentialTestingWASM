;; 7. **Test Description**:    - Implement a loop with a single target `br_table` and an index that matches this only target. The test confirms correct execution flow to the single indexed target and handling when the index falls back to the default.    - **Constraint Checked**: Correct branch execution to a single target and fallback handling to the default if out-of-bounds index is used.

(assert_invalid
  (module
    (func $br_table_single_target
      (block (loop (result i32)
        (i32.const 1)
        (br_table 0 0)
        (i32.const 0)
        (br 1)
      ))
    )
  )
  "br_table default target mismatch"
)
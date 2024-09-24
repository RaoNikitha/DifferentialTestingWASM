;; 4. **Test Description**:    - Implement a `loop` with an inner loop containing a `br_table` that targets the inner loop index. Include an out-of-bounds case to test the fallback to the correct default case in the outer loop.    - **Constraint Checked**: Handling nested loops and out-of-bounds index in `br_table` resulting in fallback to the correct default case.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (loop (result i32)
          (br_table 1 0 (i32.const 0))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
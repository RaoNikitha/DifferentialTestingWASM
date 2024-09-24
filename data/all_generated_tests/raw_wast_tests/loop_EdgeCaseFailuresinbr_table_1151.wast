;; 2. **Test Description**:    - Generate a `loop` containing a `br_table` with an index exactly equal to the number of available targets, which should trigger the default branch.    - **Constraint**: Ensures proper handling when the index is equal to the number of targets.    - **Edge Case**: Detects if the implementation correctly branches to the default target.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (br_table 0 (result i32) (i32.const 1))
      )
    )
  )
  "type mismatch"
)
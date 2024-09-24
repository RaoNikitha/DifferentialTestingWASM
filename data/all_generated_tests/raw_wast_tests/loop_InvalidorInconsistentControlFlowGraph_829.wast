;; 10. **Loop with Multiple Exit Points**:     - Design a loop with multiple conditional exits using `br_if` and `br_table`. Ensure correct handling of multiple exit paths in context management.     - **Constraint**: Correctly manage multiple exit points and ensure stack consistency.     - **CFG Check**: Verify the CFG accurately includes all potential exit paths and their stack effects.

(assert_invalid
  (module (func $multi-exit-loop (result i32)
    (i32.const 42)
    (loop (result i32)
      (br_if 1 (i32.const 1))
      (br_table 0 1 1 (i32.const 0))
    )
  ))
  "type mismatch"
)
;; 10. **Test Description**: Create a block with `br_table` targets having diverse operand expectations (e.g., `i32`, `f32`) to ensure operand stack is preconfigured incorrectly (e.g., set to `i64`).

(assert_invalid
  (module (func $test-br_table
    (block (result i32)
      (br_table 0 1 (i64.const 0))
    )
  ))
  "type mismatch"
)
;; 3. **Test 3**:    Create a sequence of nested blocks with different `valtype?` annotations. Use `br_table` to branch to various blocks depending on the top operand, ensuring each implementation correctly matches the intended block. This ensures the `br_table` navigates correctly through nested structures.

(assert_invalid
  (module (func $nested-blocks-br_table (result i32)
    (block (result i32)
      (block (result i32)
        (block (result f32)
          (br_table 0 1 2 (i32.const 1))) (br 0 (i32.const 1)) (i32.const 1))
      (br 0 (i32.const 2))
    )
  ))
  "type mismatch"
)
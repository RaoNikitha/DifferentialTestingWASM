;; 2. **Test Incorrect Nested Block Label Handling**:    - Define a nested block structure with multiple levels, each with different block types. Use `br_table` to branch to various nested levels.    - Verify if the branching correctly resolves to the intended block label, avoiding incorrect jumps to non-matching blocks.

(assert_invalid
  (module (func $test-nested-block-labels
    (block (result i32)  ; Outer block should produce i32 (type 1)
      (block (result f64)  ; Inner block should produce f64 (type 2)
        (block (result i64)  ; Innermost block should produce i64 (type 3)
          (br_table 0 1 2  ; Branching to various nested levels
            (i32.const 0))  ; Invalid type used for branching
        )
        (i32.const 0)  ; This should be an f64 according to the inner block type
      )
      (i64.const 0)  ; This should be an i32 according to the outer block type
    )
  ))
  "type mismatch"
)
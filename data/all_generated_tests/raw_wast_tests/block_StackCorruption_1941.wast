;; 2. Design a test with nested `block` instructions where the innermost block has mismatched nesting context modifications. Use `br_table` to branch to multiple labels, verifying if the stack remains consistent across all branches, thus testing for stack corruption due to the difference in label indexing.

(assert_invalid
  (module (func $nested-blocks-mismatched-nesting
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (i32.const 1)
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  ))
  "type mismatch"
)
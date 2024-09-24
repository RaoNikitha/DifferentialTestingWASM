;; 1. **Test Description**:    Create a nested block structure where the innermost block attempts a `br_table` branching to an outer block, but the targets are set to indices beyond the available label range. This will check if both implementations correctly handle invalid branch targets within nested blocks.

(assert_invalid
  (module (func $block_invalid_br_table (result i32)
    (block (result i32)
      (block (br_table 1 (i32.const 0)))
      (i32.const 10)
    )
  ))
  "unknown label"
)
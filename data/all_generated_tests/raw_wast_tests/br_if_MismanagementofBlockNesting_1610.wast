;; 1. **Test for Deeply Nested Blocks with Multiple br_if Conditions**:     Create a nested structure with multiple blocks and inner conditional branches using `br_if`. The test will check if the correct block is exited based on the condition. This will reveal if either implementation incorrectly handles the depth of nested blocks.

(assert_invalid
  (module (func $nested-blocks-multiple-brif (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br_if 2 (i32.const 1) (i32.const 0))
          (i32.const 42)
        )
        (i32.const 99)
      )
      (i32.const 7)
    )
  ))
  "type mismatch"
)
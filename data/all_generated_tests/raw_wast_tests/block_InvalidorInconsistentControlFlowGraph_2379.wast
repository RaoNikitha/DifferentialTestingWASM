;; 10. **Test Block with Mixed Instructions and Nested Blocks**:     - Create a block containing a mix of instructions (e.g., arithmetic operations) followed by nested blocks.     - **Reasoning**: Tests the CFG to ensure it accurately maintains control flow across mixed instruction types and nested block contexts.     - **Purpose**: Verify the CFG's robustness in mixed contexts of instructions and nested blocks.

(assert_invalid
  (module (func $test-block-mixed-nested
    (block (result i32)
      (i32.const 5)
      (i32.add (i32.const 3) (i32.const 2))
      (block
        (i32.sub (i32.const 8) (i32.const 3))
        (block (i64.const 10) (drop))
      )
      (drop)
    )
  ))
  "type mismatch"
)
;; 3. **Test Deeply Nested Blocks with Mismatched Labels**:    - Implement multiple nested blocks with labels that incorrectly refer to the wrong nesting levels.    - **Reasoning**: This tests whether the labels and context are accurately maintained across nested blocks within the CFG.    - **Purpose**: Ensure accurate label management within deeply nested blocks.

(assert_invalid
  (module (func $deeply-nested-blocks-mismatched-labels
    (block (result i32)
      (block
        (block
          (br 2 (i32.const 10)) 
          (i32.const 20)
        )
        (i32.const 30)
      )
      (i32.const 40)
    )
  ))
  "unknown label"
)
;; 3. **Returning from Inside Block**:    - **Description**: Create a block that contains a `return` instruction to test if the function correctly returns from inside the block context.    - **Constraint**: Validate correct return handling from within a block.    - **Improper Handling**: The block might not allow proper return, causing the function to continue executing unintended instructions.

(assert_invalid
  (module
    (func $return-from-block (result i32)
      (i32.const 42)
      (block (result i32)
        (return)
        (i32.const 7)
      )
    )
  )
  "type mismatch"
)
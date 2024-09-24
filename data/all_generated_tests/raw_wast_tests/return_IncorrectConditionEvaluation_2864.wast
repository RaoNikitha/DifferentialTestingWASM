;; 3. **Complex Nested Blocks with Early Return**:    - Implement a function with nested blocks and inner return statements within conditional branches. The test should verify if intermediate values are correctly discarded when a return is executed.    - **Reasoning**: This examines context and block management, validating that stack unwinding works correctly within nested structures.

(assert_invalid
  (module
    (func $nested-blocks-early-return (result i32)
      (block
        (i32.const 42)
        (block
          (if (i32.const 1) (then 
            (block
              (return (i32.const 99))
            )
          ))
        )
      )
    )
  )
  "type mismatch"
)
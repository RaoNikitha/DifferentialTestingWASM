;; 7. **Combination of Return in Try-Catch Blocks**:    - Create a function using try-catch blocks with returns in both try and catch sections. This tests if returns are correctly handled within such blocks and if any improper function call returns can be identified.

(assert_invalid
  (module
    (func (result i32)
      (try (result i32)
        (do 
          (return (i32.const 1))
        )
        (catch 
          (return (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)
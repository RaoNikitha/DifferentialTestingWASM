;; 4. **Deeply Nested Blocks with Return Statements**:    - Craft a test with several nested blocks, each containing different numbers of instructions and return statements. This examines whether the return instruction correctly identifies and returns from the outermost block, ensuring proper stack unwinding.

(assert_invalid
  (module
    (func $nested-blocks-return (result i32)
      (block 
        (block 
          (block 
            (i32.const 42)
            (return)
          )
          (return)
        )
        (return)
      )
    )
  )
  "type mismatch"
)
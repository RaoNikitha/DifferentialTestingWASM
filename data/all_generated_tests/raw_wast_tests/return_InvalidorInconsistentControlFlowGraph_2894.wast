;; 3. **Nested Block with Early Return**:    Use a block inside a function with an early `return` within the block.    - Tests correct unwinding and control flow from nested blocks to the function level.

(assert_invalid
  (module
    (func $nested-block-with-early-return (result i32)
      (block 
        (block 
          (br 1 (return (i32.const 42)))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
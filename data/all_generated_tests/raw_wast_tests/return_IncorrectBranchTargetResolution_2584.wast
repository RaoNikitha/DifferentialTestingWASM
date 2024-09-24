;; 3. **Test with Loops and Returns within Blocks**    - **Description**: Implement a loop within a function body where a `return` instruction is nested inside a block within the loop.    - **Constraint**: The test checks if the `return` unwinds correctly to the outermost function scope and not just the loop termination block.

(assert_invalid
  (module
    (func $loop-return-in-block (result i32)
      (loop (result i32)
        (block (br_if 0 (i32.const 1)))
        (return (i32.const 0)) 
      )
    )
  )
  "type mismatch"
)
;; 2. A test where a deeply nested block has a `return` instruction. The test should verify if the stack discards intermediate values correctly and returns to the outermost block without corrupting the stack state.

(assert_invalid
  (module
    (func $nested-blocks-with-return (result i32)
      (block 
        (block 
          (i32.const 10) 
          (block 
            (block
              (i32.const 20) 
              (return)
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)
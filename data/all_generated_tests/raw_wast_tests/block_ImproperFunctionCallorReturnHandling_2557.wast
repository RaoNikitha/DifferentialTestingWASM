;; 8. **Return from Nested Call within Block**: Verify if a `return` instruction from a nested function call within a block correctly exits control flow and unwinds the block's stack.    ```    block $block9      call $nested_func      return    end    ```

(assert_invalid
  (module
    (func $nested_func (result i32)
      (i32.const 42)
    )
    (func $test_block_return 
      (result i32)
      (block $block9
        (call $nested_func)
        return
      )
    )
  )
  "type mismatch"
)
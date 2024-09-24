;; 3. **Block Followed by Nested Call and Return**: Enclose a block containing a nested block, which calls a function and verifies correct returning through multiple nested levels.    ```    block $block3      block $block4        call $func2      end    end    ```

(assert_invalid
  (module
    (func $nested-blocks-return (result i32)
       (block (result i32)
         (block (result i32) 
           (call $func)
         )
       )
    )
    (func $func (result i32)
      i32.const 1
    )
  )
  "type mismatch"
)
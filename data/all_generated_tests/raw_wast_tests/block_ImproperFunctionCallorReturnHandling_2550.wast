;; 1. **Nested Block with Direct Call**: Test a `block` containing a function call to ensure proper call/return handling within nested blocks. This examines if the return from the call correctly unwinds the block stack.    ```    block $block1      call $func1    end    ```

(assert_invalid
 (module
  (func $nested-block-with-direct-call
   (block (result i32)
    (call $func1)
   )
  )
  (func $func1 (result i32))
 )
 "type mismatch"
)
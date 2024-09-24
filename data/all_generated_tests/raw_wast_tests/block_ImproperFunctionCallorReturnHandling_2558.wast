;; 9. **Multiple Calls within a Block**: Place multiple function calls within a block to examine if consecutive calls are handled correctly and return values are properly managed.    ```    block $block10      call $func7      call $func8    end    ```

(assert_invalid
  (module
    (func $func1 (result i32) (i32.const 42))
    (func $func2 (result i32) (i32.const 7))
    (func $multi-call (result i32)
      (block (result i32)
        (call $func1)
        (call $func2)
      )
    )
  )
  "type mismatch"
)
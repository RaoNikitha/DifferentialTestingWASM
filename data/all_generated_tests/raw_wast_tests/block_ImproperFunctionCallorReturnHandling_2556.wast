;; 7. **Function Call with Incorrect Return Handling**: Deliberately mismatch function return types within a block to test the implementation's reaction to improper return handling.    ```    block $block8 (result i64)      call $func6 (result i32)      drop    end    ```

(assert_invalid
  (module
    (func $func6 (result i32) (i32.const 42))
    (func $test
      (block (result i64)
        (call $func6)
        drop
      )
    )
  )
  "type mismatch"
)
;; 6. **Function Call with Type Return Check**: Inside a block, call a function that returns a specific type to check if return type validation is handled in the block context.    ```    block $block7      call $func5      i32.const 0      i32.eq      br_if $label3    end    ```

(assert_invalid
  (module
    (func $func5 (result i32)
      i32.const 42
    )
    (func $test
      block $label3
        call $func5
        i32.const 0
        i32.eq
        br_if $label3
      end
    )
  )
  "type mismatch"
)
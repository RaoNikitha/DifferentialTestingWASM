;; 2. **Test 2**: Test includes a block that expects an `i32` return value, but the called function inside the block returns an `f32`. This checks if the function signature validation ensures the correct type is returned from the block.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $func-returns-f32 (result f32)
      (f32.const 0.0)
    )
    (func $block-with-i32-return (result i32)
      (block (result i32)
        (call $func-returns-f32)
      )
    )
  )
  "type mismatch"
)
;; 6. **Test 6**: Implement a series of nested blocks with varying operand stack heights. Use a `br` instruction to attempt exiting a block with a specific target label and verify if stack unwinding handles the nesting correctly, maintaining the correct types on the operand stack.

(assert_invalid
  (module
    (func $test_nested_blocks
      (block $outer (result i32)
        (block $inner (result i32)
          (i32.const 42)
          (br 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
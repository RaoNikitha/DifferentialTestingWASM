;; 10. A test that pushes the maximum allowable values onto the stack, invokes the `return` instruction, and checks whether the stack handling in extreme cases does not lead to overflows or underflows.

(assert_invalid
  (module
    (func $max-stack-values (result i32)
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      i32.const 2147483647
      return
      i32.const 0
    )
  )
  "type mismatch"
)
;; 7. **Test 7: Stack-Polymorphic Return Scenarios**    - Create tests with polymorphic stack behavior using functions having different sequences of returns interleaved with other instructions manipulating the stack.    - *Related Constraint*: Validates adaptability of `return` instruction across different stack types.

(assert_invalid
  (module
    (func $stack-polymorphic-return
      (i32.const 42)
      (return)
      (i32.const 99)
    )
  )
  "type mismatch"
)
;; 5. **Test Description**: Export a function that manipulates the operand stack heavily, including pushing and popping elements, then ending with a `return` instruction. Import this function into another module and verify post-call stack state.

(assert_invalid
  (module
    (func $stack_manipulation (export "stack_manipulation") (result i32)
      (i32.const 10)
      (i32.const 20)
      (drop)
      (i32.const 30)
      (return)
    )
  )
  "type mismatch"
)
;; 10. **Edge Case in Stack-Polymorphism**:    - Create a function with polymorphic instructions, wherein the `return` instruction interacts with polymorphic types in an edge case scenario. This test verifies if the CFG maintains type safety and correct handling of polymorphic stacks through return instructions.

(assert_invalid
  (module
    (func $stack-polymorphism-edge-case (result i32)
      (i32.const 1)
      drop
      (i64.const 0)
      (return)
    )
  )
  "type mismatch"
)
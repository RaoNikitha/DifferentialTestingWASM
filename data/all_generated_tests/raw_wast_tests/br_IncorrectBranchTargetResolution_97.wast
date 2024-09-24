;; 8. **Nested Block Branch Test**: Create nested blocks of differing operand types and craft a `br` instruction within the inner block, targeting the outer block’s label. Check if the implementation respects the operand type requirements and maintains structured branching accurately.

(assert_invalid
  (module
    (func
      (block (result i32)
        (i32.const 0)
        (block (result i32)
          (i32.const 1)
          (br 1)
          (i32.add)
        )
      )
    )
  )
  "type mismatch"
)
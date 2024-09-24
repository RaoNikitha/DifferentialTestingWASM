;; 2. **Test for Mismatched Block Type on Return**: Design a function with a block that expects a `f32` as its result type but feeds an `i64` operand. The test checks differential behavior when the `return` instruction is utilized within the block to see how type mismatches are managed.

(assert_invalid
  (module
    (func $mismatched-block-return-type
      (block (result f32)
        (return (i64.const 42))
      )
    )
  )
  "type mismatch"
)
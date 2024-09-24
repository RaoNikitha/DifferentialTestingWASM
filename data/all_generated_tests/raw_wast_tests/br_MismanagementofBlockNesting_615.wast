;; 6. **Test with Operand Stack Management in Nested Structures:**    Create tests involving nested blocks where operand stacks must be unwound and managed correctly when a `br` instruction is executed. This tests correct stack behavior in nested contexts.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block
          (i32.const 10)
          (block (result i32)
            (i32.const 20)
            (br 1)
            (i32.const 30)
          )
          (i32.add)
        )
      )
    )
  )
  "type mismatch"
)
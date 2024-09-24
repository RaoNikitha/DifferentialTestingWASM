;; 4. Implement a set of nested `block` instructions where the innermost block has a `br` instruction targeting the outermost block. This checks if the operand stack is properly managed and unwound up to the height of the outermost block.

(assert_invalid
  (module
    (func
      (block (result i32 i32)
        (block
          (block
            (br 2 (i32.const 42) (i32.const 10))
          )
        )
      )
    )
  )
  "type mismatch"
)
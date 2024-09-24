;; 1. Create a block with two nested inner blocks, and within the innermost block, use a `br` instruction to jump to the outer block. The test checks whether the jump correctly skips the inner block and reaches the outer block as intended.

(assert_invalid
  (module (func $nested-blocks-br (result i32)
    (block (result i32)
      (block (result i32)
        (br 1 (i32.const 0))
      )
      (br 0 (i32.const 1))
    )
  ))
  "type mismatch"
)
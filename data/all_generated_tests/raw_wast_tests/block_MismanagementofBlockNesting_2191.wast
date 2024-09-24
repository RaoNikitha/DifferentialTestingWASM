;; A test where a block contains another block and within the inner block, an early `br` instruction is used to jump out of the inner block. This will verify the handling of proper label indexing and stack unwinding.

(assert_invalid
  (module (func $nested-block-early-br (result i32)
    (block (result i32)
      (block (result i32) 
        (br 1 (i32.const 10))
      )
      (i32.const 20)
    )
  ))
  "type mismatch"
)
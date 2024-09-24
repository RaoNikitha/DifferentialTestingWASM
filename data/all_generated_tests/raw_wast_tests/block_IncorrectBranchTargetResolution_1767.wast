;; 8. A test where the block contains several `br` instructions with different label indices, ensuring each branch resolves to the correct block based on relative positioning and verifying correct label stack manipulation.

(assert_invalid
  (module (func $block_multiple_br (result i32)
    (block (result i32)
      (block
        (br 1 (i32.const 42))
        (br 0 (i32.const 2))
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)
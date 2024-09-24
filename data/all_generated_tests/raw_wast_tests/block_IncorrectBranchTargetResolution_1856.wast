;; Build a block structure where `br` instructions are used to transition into non-adjacent blocks. Place these instructions in various positions within the nested blocks to ensure all are correctly resolved to the expected outermost block.

(assert_invalid
  (module (func $block-nested-br
    (block (result i32)
      (i32.const 1)
      (block (result i32)
        (br 0 (i32.const 2))
        (block (result i32)
          (br 2 (i32.const 3))
        )
        (i32.const 4)
      )
    )
  ))
  "type mismatch"
)
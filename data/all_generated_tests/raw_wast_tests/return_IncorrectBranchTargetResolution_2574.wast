;; A conditional branch within a function leading to an intermediary block followed by a `return` instruction, checking that the return correctly skips all blocks and exits the outermost block.

(assert_invalid
  (module
    (func $conditional-branch-to-return (result i32)
      (i32.const 1)
      (if (then 
          (block 
            (i32.const 2) 
            (return)))
        )
      (i32.const 0)
    )
  )
  "type mismatch"
)
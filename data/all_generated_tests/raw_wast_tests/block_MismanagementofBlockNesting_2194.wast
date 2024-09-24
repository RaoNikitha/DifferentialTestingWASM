;; A test with a block nested inside a loop, where a `br` in the inner block should not affect the outer loop but should exit the block correctly. This tests the coordination between loops and blocks and their respective labels.

(assert_invalid
  (module (func $nested-loop-block-br (result i32)
    (loop (result i32)
      (block (result i32) 
        (br 1 (i32.const 42))
        (br 0 (i32.const 0))
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)
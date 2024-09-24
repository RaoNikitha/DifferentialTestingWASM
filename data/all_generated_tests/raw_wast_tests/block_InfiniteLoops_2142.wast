;; Test Description 3: Use a block encapsulating a `loop` instruction where a `br_if` condition inside the loop always reverts back to the block start label. This tests if the context maintains accurate label indices and does not trap the execution in an endless loop.

(assert_invalid
  (module (func $block-loop-br_if
    (block (result i32)
      (loop (result i32)
        (br_if 1 (i32.const 0))
        (i32.const 1)
      )
      (br 1 (i32.const 2))
    )
  ))
  "type mismatch"
)
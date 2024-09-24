;; Test Description 6: A `block` instruction that contains a loop, where the loop breaks on a `br_if` instruction based on a decrementing counter. Check whether the loop exits correctly given the counter reaching zero.

(assert_invalid
  (module (func $block-loop-break (result i32)
    (block (result i32)
      (i32.const 5)
      (loop (result i32)
        (i32.const 1)
        (i32.sub)
        (local.tee 0)
        (br_if 1 (i32.eqz))
      )
    )
  ))
  "type mismatch"
)
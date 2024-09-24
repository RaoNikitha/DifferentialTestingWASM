;; 9. **Test Description: Loop with Nested Blocks**    - Create a `loop` that contains nested `block` structures, and use a `br` instruction to target an outer `block` label.

(assert_invalid
  (module
    (func $loop-with-nested-blocks
      (loop $outer_loop
        (block $inner_block
          (br 1)
          (nop)
        )
        (nop)
      )
    )
  )
  "invalid target label"
)
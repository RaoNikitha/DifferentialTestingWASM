;; 6. **Multiple Loops with Nested Blocks and Unreachable:**    - Develop multiple loops, each containing nested blocks with the `unreachable` instruction inside one of the blocks. Ensure that when `unreachable` is triggered, all loops and blocks appropriately trap and do not mismanage the control flow.

(assert_invalid
  (module
    (func $multiple-loops-nested-blocks
      (loop
        (block
          (loop
            (block
              (unreachable)
              (i32.const 1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
;; 7. **Test Description 7**: Construct a `block` within a `loop` and place a `br_if` instruction within the `block` targeting the `loop`. The `block` should push and consume several operands. Confirm that stack operations reflect the correct operand management for both the `block` and the `loop`.

(assert_invalid
  (module
    (func $block-within-loop
      (loop
        (block
          (i32.const 1) (i32.const 2) (i32.const 3)
          (drop) (drop)
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)
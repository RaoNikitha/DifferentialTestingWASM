;; 3. **Test Description:**    Design a sequence of nested `block` and `loop` structures where the `br` instruction is placed within a nested `block` and is intended to target a specific outer `block`. This test should validate that the `br` instruction correctly targets the intended outer `block` and not any intermediate `block` or `loop`.

(assert_invalid
  (module
    (func $br_nested_blocks
      (block
        (block
          (block (result i32)
            (i32.const 0)
            (block (br 3)) (br 0)
          )
        )
      )
    )
  )
  "label index out of range"
)
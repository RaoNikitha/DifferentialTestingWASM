;; 3. **Test Description**: Use a negative index as the operand in the `br_table` instruction. While indices should be non-negative, this ensures that implementations handle and trap negative indices appropriately.

(assert_invalid
  (module
    (func $negative-index
      (block
        (br_table -1 0)
      )
    )
  )
  "invalid index"
)
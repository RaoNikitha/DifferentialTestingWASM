;; 5. **Test with Nested Blocks and `br_table` Instruction**:     - Use the `br_table` instruction within nested blocks containing `nop` to jump to various levels of outer blocks. Verify that control jumps to intended blocks.    - This verifies correct `br_table` handling in the presence of `nop` within nested blocks, which can potentially confuse branch target resolution if mismanaged.

(assert_invalid
  (module
    (func (block
      (block
        (nop)
        (br_table 0 1 0)
      )
      (nop)
    ))
  )
  "invalid block referenced by br_table"
)
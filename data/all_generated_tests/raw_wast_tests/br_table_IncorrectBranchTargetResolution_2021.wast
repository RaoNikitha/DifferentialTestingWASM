;; Provide a `br_table` instruction with labels targeting nested blocks. Manipulate the operand to cause the branch to incorrectly resolve to an inner block’s label, thus testing if label indexing respects the block depth and correctly targets the outermost blocks.

(assert_invalid
  (module
    (func $invalid-label-targeting
      (block
        (block
          (br_table 0 1 (i32.const 1))
        )
      )
    )
  )
  "unknown label"
)
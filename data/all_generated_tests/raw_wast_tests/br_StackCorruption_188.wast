;; 9. Test a scenario where the `br` instruction within a nested block targets a label that was pushed onto the stack right before the block entered, testing whether the relative index lookup is correct and the stack state remains valid.

(assert_invalid
  (module
    (func $nested_block_label_indexing
      (block
        (block
          (block
            (br 3) 
          )
        )
      )
    )
  )
  "unknown label"
)
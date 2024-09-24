;; 10. **Branching to Inline Blocks Confusing CFG:**    - **Test Description:** Place `br` instructions that target inline blocks or unexpected inline positions within a block, aiming to confuse the CFG generation process regarding inline target positions.    - **Constraint Tested:** Forward branch targeting and inline block addressing.    - **CFG Relevance:** Improper handling of inline block targets can create invalid gaps or overlaps in the CFG, making the paths unattainable or wrongly aligned.

(assert_invalid
  (module
    (func $confusing-inline-blocks
      (block
        (block (br 1))
        (drop (i32.const 1))
      )
    )
  )
  "unknown label"
)
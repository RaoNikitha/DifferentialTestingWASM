;; 4. Formulate a deeply nested combination of blocks and loops, using a `br` instruction to target a middle-level block. Validate that the branch jumps to the correct block level without being affected by the relative indexing of the nested structures.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (loop
          (block
            (br 2)
          )
          (br 0)
        )
      )
    )
  )
  "unknown label"
)
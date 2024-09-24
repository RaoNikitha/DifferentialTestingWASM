;; 1. **Test Description**: Create a sequence of nested blocks where each block contains a single `nop` instruction. Verify CFG handles nested blocks correctly.    **Constraint Checked**: Ensures that nesting of blocks doesn't alter flow due to `nop`.    **Relation to CFG**: Verifies the nested structure doesn’t cause unexpected control flow interruptions or unaligned branches.

(assert_malformed
  (module
    (func
      (block
        (block
          (block
            (nop)
          )
        )
      )
    )
  )
  "invalid instruction"
)
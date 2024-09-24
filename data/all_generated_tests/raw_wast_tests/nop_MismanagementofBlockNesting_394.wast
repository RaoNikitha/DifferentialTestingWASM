;; 5. **Deep Nesting with `nop` and `br_table`**:    Construct a block that heavily uses the `br_table` instruction for control transfer, with `nop` instructions interleaved at various nesting levels. This tests whether the indexed control transfer accounts for `nop` without misinterpreting block depths.

(assert_invalid
  (module
    (func
      (block $outer
        (block $middle
          (block $inner
            (nop)
            (br_table $outer $middle $inner)
            (nop)
          )
        )
      )
    )
  )
  "type mismatch"
)
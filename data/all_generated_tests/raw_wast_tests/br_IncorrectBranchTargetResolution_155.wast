;; 6. **Test Description:**    Create a nested control pattern where multiple `if` and `block` statements are combined, and the `br` instruction targets a specific middle-tier block's label. This test helps validate if the `br` instruction can accurately resolve and branch to a non-innermost or non-outermost, but middle-tier block.

(assert_invalid
  (module
    (func $nested-middle-tier-target
      (block $outer
        (block $middle
          (block $inner
            (br 1)
          )
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)
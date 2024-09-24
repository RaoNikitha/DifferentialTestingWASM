;; 3. **Deeply Nested Branch Test**: Construct a deeply nested structure of alternating blocks and loops, and within this, use a `br` instruction to target a label several levels outward. Ensure the branch lands on the correct target block or loop, checking for proper relative lookup.

(assert_invalid
  (module
    (func $deeply_nested_branch
      (block
        (loop
          (block
            (loop
              (block
                (br 4)
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)
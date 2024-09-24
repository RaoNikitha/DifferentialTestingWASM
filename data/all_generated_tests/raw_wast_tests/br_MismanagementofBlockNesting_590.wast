;; 1. Test a series of nested `block` instructions where the `br` instruction targets a deeply nested block (e.g., `block (block (block (br 2)))`). This tests if the implementation can handle deep nesting levels and correctly unwind to the targeted block.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br 2)
          )
        )
      )
    )
  )
  "unknown label"
)
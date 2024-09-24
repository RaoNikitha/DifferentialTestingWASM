;; 6. Create a sequence of nested `block` instructions with various `br` instructions inside each block targeting labels at the same level but in different blocks (e.g., `block (block (br 1)) block (block (br 0))`). This verifies if the implementation can correctly manage and differentiate between `br` targets in similar nesting levels.

(assert_invalid
  (module
    (func $nested-blocks-with-brs
      (block
        (block
          (br 1)
        )
      )
      (block
        (block
          (br 0)
        )
      )
    )
  )
  "invalid br target"
)
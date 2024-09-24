;; 1. Create a nested structure with three levels of `block` instructions where the innermost block has a `br 2` instruction. This tests if `br` correctly breaks out of the outermost block. The constraint here is ensuring that relative label indexing is interpreted correctly across deeply nested blocks.

(assert_invalid
  (module
    (func $test-br
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
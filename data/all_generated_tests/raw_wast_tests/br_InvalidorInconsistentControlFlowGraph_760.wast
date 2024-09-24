;; 1. **Misinterpreting Nested Labels Test**: Create a deeply nested set of `block`, `loop`, and `if` structures, and place a `br` instruction in the innermost `block` that targets an outer `block` with a highly nested label index. This tests whether the label indexing is correctly interpreted relative to the nesting depth.

(assert_invalid
  (module
    (func (block
        (loop
          (if 
            (block 
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)
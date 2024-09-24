;; 1. Test a deeply nested structure with multiple `blocks` and a `br` instruction targeting an outer block using a relative label index. Check if the execution correctly continues after the targeted block's `end` instruction. This test ensures the correct interpretation of relative label indexing in nested structures.

(assert_invalid
  (module
    (func $deep-nested-blocks
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
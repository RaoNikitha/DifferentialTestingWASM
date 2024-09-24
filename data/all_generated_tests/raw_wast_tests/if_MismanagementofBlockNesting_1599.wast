;; 10. **Complex `br_table` in Deep Nesting**: Integrate a `br_table` instruction within a deeply nested `if`-`loop`-`block` structure. This tests correct nesting interpretations and branch table indexing within complex nested blocks.

(assert_invalid
  (module
    (func $deep-nested-br_table
      (block (result i32)
        (loop (result i32)
          (if (i32.const 1) (result i32)
            (block (result i32)
              (if (i32.const 1) (result i32)
                (block (result i32)
                  (br_table 0 1 (i32.const 0))
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
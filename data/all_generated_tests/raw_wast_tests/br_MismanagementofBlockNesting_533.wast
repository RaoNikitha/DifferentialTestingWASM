;; 4. Create a test with a nested `block` within a `loop`, with a `br` instruction targeting the outer loop from within the nested block. This will ensure the implementation manages block and loop nesting correctly.

(assert_invalid
  (module
    (func $nested_block_with_loop
      (loop
        (block
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)
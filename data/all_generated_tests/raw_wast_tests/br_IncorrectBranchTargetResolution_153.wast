;; 4. **Test Description:**    In a series of nested `block` structures, include a `br` instruction directed at a deeply nested block (e.g., jumping out from the fourth to the first nested block). This test will assess whether the `br` correctly resolves and jumps to the first block, verifying the correct implementation of multi-level block nesting.

(assert_invalid
  (module
    (func $test-nested-blocks-br
      (block
        (block
          (block
            (block
              (br 3)
            )
          )
        )
      )
    )
  )
  "label index out of range"
)
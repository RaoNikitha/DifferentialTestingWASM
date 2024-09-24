;; 3. Combine `if` and `block` structures, targeting the `if` label with a `br` instruction. Check if the right label index is properly resolved in a mixed control context.

(assert_invalid
  (module
    (func $combine-if-block
      (block
        (if (i32.const 1)
          (br 1)
        )
      )
    )
  )
  "unknown label"
)
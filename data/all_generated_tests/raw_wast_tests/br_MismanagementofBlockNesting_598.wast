;; 9. Structure nested blocks where the `br` instruction targets the innermost block within a deeply nested structure (e.g., `block (block (block (br 0)))`). This ascertains if the implementation respects the label index for the innermost block consistently.

(assert_invalid
  (module
    (func
      (block (block (block (br 0))))
    )
  )
  "unknown label"
)
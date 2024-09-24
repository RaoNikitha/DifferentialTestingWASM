;; Here is the list of test descriptions:  1. **Test Misresolved Top-Level Label:**    - Set up a `br` instruction referencing a top-level label outside of any nested control blocks. This checks if the implementation properly resolves and jumps to the outermost label.

(assert_invalid
  (module
    (func
      (block (block (block (br 3))))
    )
  )
  "unknown label"
)
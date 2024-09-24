;; 4. **Incorrect `br` Branch in `else` Block**:    - Set up an `if` instruction with an `else` containing a `br` instruction targeting a non-direct parent label (i.e., skipping an intermediate block).    - Ensures that branches from `else` are correctly resolved in a well-nested block structure.    - This focuses on ensuring correct resolution of branches skipping immediate scopes.

(assert_invalid
  (module
    (block $label1
      (if (result i32)
        (i32.const 0)
        (then (i32.const 1))
        (else (br $label1))
      )
    )
  )
  "invalid branch"
)
;; 1. **Nested Loop Branch Test**: Create a nested loop structure with a misreferenced `br` instruction where an inner loop attempts to break to an outer loop's label. Check if the branch correctly targets the outer loop, correctly interpreting relative label indices.

(assert_invalid
  (module
    (func
      (loop (loop (br 2)))
    )
  )
  "undefined label"
)
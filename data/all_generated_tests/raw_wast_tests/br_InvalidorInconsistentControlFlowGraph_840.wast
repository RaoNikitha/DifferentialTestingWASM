;; 1. **Misinterpreted Relative Label Indices in Nested Structures:**    - **Test Description:** Create a deeply nested set of `block`s and `loop`s, then use the `br` instruction with labels targeting various depths. The goal is to test whether the implementations correctly handle relative label lookups in complex nesting.    - **Constraint Tested:** Correct relative label indexing.    - **CFG Relevance:** Misinterpreted labels can lead to invalid jumps, causing incorrect paths in the CFG.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (loop
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)
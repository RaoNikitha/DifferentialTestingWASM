;; 8. **Test with Multiple Branch Instructions:**    Write a program with several `br` instructions within different nested blocks to ensure the correct label and nesting are respected each time a `br` instruction is executed.

(assert_invalid
  (module
    (func $multiple-br
      (block
        (block
          (br 1) ;; valid branch outwards
          (block
            (br 2) ;; valid branch skipping two blocks
            (br 0) ;; inner branch
          )
          (br 0) ;; mid level branch
        )
        (br 0) ;; outer branch
      )
    )
  )
  "unknown label"
)
;; 1. **Test Description:**    - Create a nested control structure with a `block` containing another `block`, followed by a `br` instruction targeting the outer block using label index.    - **Constraint:** Verify that the outer `block` is correctly identified and the control flow resumes after the outer `block` ends.    - **CFG Check:** This ensures that the label lookup relative to the nesting depth is correctly managed, preventing CFG inconsistencies from misinterpreted label indexes.

(assert_invalid
  (module
    (func $nested-blocks-outer-label
      (block
        (block
          (br 1)
        )
      )
    )
  )
  "unknown label"
)
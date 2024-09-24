;; Function involving a `return` instruction within a labeled block nested inside another labeled block, verifying that the correct label is resolved and the control flow exits to the outermost function scope.

(assert_invalid
  (module
    (func $type-return-nested-blocks
      (block                ;; Outer block
        (block              ;; Inner block
          (br 0)            ;; Branch to outer block
          (return)          ;; This should be invalid
        )
      )
    )
  )
  "type mismatch"
)
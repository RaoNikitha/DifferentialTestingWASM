;; 1. Attempt to branch to a label outside the bounds of defined labels:    Test an instruction sequence featuring nested `block` and `loop` constructs, where a `br` instruction tries to reference a label beyond the outermost block. This should check the validity of label definition and relative indexing handling.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (br 3)
          )
        )
      )
    )
  )
  "unknown label"
)
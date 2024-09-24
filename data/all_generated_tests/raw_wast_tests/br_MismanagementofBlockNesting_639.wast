;; 10. Create a set of nested `if` and `block` instructions where the innermost level has `br 1` and `br 2` instructions placed adjacently. This differential test ensures both target the correct labels and manage control flow transitions properly through nested blocks.

(assert_invalid
  (module
    (func $nested-br-test
      (block
        (block
          (if
            (block (br 1))
          )
          (br 2)
        )
      )
    )
  )
  "type mismatch"
)
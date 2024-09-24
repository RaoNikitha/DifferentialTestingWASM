;; 5. **Deeply Nested `nop` with Immediate Branches**: Create deeply nested blocks (e.g., four or five levels) containing individual `nop` instructions and immediate `br`. Evaluate if the branch target resolution skips intended blocks due to `nop` misinterpretation.

(assert_invalid
  (module
    (func $deep-nested-nop
      (block $outer
        (block $inner
          (block
            (block
              (block
                (nop)
                (br $outer)
              )
              (nop)
            )
            (nop)
          )
        )
        (nop)
      )
    )
  )
  "type mismatch"
)
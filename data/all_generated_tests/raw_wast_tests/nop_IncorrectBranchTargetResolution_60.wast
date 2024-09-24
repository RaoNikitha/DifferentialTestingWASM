;; 1. Test with a sequence of nested `if-else` blocks interspersed with `nop` instructions to verify that each `br` instruction correctly resolves to the intended block, ensuring the `nop` does not alter the control flow in either implementation.

(assert_invalid
  (module
    (func $nested-if-else
      (block $outer
        (block $inner
          (if (i32.const 1)
            (then
              (nop)
              (br $outer)
            )
            (else
              (nop)
              (br $inner)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
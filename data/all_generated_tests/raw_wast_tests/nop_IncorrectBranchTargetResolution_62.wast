;; Use a series of `nop` instructions within a function containing multiple nested `loop` structures and `br` instructions to test that the `br` instruction correctly identifies and jumps to the intended loop, and ensure `nop` does not interfere with branch target resolution in either implementation.

(assert_invalid
  (module
    (func $nested-loops
      (loop $outer
        (nop)
        (loop $inner
          (br $outer)
          (nop)
        )
        (nop)
      )
    )
  )
  "branch target label not found"
)
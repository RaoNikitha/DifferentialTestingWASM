;; 8. An outer block containing multiple nested block structures with `nop` instructions strategically placed to ensure that escaping a nested block or loop with a `br` instruction navigates the correct number of layers, checking for any mismanagement in how `nop` affects nesting interpretation.

(assert_invalid
  (module
    (func $test
      (block $outer
        (block $inner1
          (nop)
          (br $outer)
          (nop)
        )
        (block $inner2
          (nop)
          (br $inner2)
          (nop)
        )
        (br $outer)
      )
    )
  )
  "type mismatch"
)
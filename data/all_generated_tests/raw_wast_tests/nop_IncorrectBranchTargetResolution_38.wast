;; - Test Description 9: Write a WebAssembly script embedding multiple levels of `block`, `loop`, and `if` structures, including `nop` instructions before each `br` and `br_if`. Check whether these `nop` instructions cause incorrect resolution of branch targets within nested structures.

(assert_invalid
  (module
    (func 
      (block $outer
        (block $inner
          nop
          (br $inner)
          nop
          (br $outer)
          nop
        )
      )
    )
  )
  "incorrect resolution of branch targets"
)
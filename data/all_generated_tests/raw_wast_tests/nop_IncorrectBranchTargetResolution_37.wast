;; - Test Description 8: Create a function with nested loops and conditional branches, placing `nop` instructions before each `end` instruction that concludes blocks. Test if the presence of `nop` results in branches resolving to the wrong blocks or loops.

(assert_invalid
  (module
    (func $nested-loops-branches
      (block $outer
        (loop $inner
          i32.const 0
          br_if $outer
          nop
          br_if $inner
          nop
        )
        nop
      )
    )
  )
  "invalid block end"
)
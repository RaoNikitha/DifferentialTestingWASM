;; - Test Description 3: Implement a section with multiple nested blocks, placing `nop` instructions at various points. Add `br` instructions that target these blocks, and verify if any `nop` instruction triggers incorrect resolution of branch targets, causing undesired control flow.

(assert_invalid
  (module
    (func $nested-blocks 
      (block $outer-block
        (nop)
        (block $inner-block
          (nop)
          (br $outer-block)
          (nop)
        )
        (br $inner-block)
        (nop)
      )
      (nop)
    )
  )
  "branch target invalid"
)
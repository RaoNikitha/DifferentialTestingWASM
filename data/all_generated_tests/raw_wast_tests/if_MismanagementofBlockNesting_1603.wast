;; 4. An `if` instruction within a `block`, followed by another `block` that contains another `if`-`else` instruction. This tests if the handling of nested control flow structures is consistent when there are sequential but separate control blocks.

(assert_invalid
  (module 
    (func $nested-if-blocks
      (block 
        (if (i32.const 1)
          (then)
        )
        (block
          (if (else (i32.const 0))
          )
        )
      )
    )
  )
  "unexpected token"
)
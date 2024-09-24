;; 9. Embed `nop` instructions immediately before an `end` instruction of a `block` or `loop` to verify that the closing of these control structures handles the stack state correctly without any corruption observed from the `nop`.

(assert_invalid
  (module
    (func
      (block
        nop
      )
    )
  )
  "unexpected end of block"
)
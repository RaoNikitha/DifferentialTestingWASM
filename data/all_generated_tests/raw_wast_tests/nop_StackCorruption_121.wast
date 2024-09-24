;; 2. Place multiple consecutive `nop` instructions within a nested `block` and `loop` structure, verifying that these do not alter the stack's state before entering and after exiting the nested control flow constructs.

(assert_invalid
  (module
    (func $nested-nop
      (block
        (loop
          (nop)
          (nop)
          (br 1)
        )
      )
    )
  )
  "unexpected end of section or function"
)
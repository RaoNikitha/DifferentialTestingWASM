;; Place `nop` instructions within a deeply nested structure containing `if`, `else`, and `block` instructions with `br` and `br_if` branches to check if the correct branch targets are identified despite the presence of `nop`.

(assert_invalid
  (module
    (func $nested-structure
      (block $outer
        (block $inner
          (if (i32.const 1)
            (then
              (block $then
                (br $outer)
                (nop)
              )
            )
            (else
              (block $else
                (br_if $inner (i32.const 1))
                (nop)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
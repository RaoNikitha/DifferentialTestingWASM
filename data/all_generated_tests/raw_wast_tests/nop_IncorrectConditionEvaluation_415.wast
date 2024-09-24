;; 6. Position `nop` instructions within nested blocks with `br_if` statements. Inspect if nested branches are evaluated correctly, ensuring `nop` doesn't affect nested conditional evaluations.

(assert_invalid
  (module
    (func $complex-nop
      (block $outer
        (block $inner
          (nop)
          (br_if $outer (i32.const 1))
          (nop)
        )
        (nop)
      )
    )
  )
  "type mismatch"
)
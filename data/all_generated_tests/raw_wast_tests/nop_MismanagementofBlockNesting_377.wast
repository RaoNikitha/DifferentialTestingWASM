;; 9. A function with nested loops containing break (`br`) instructions and interspersed `nop` instructions to ensure that loop control breaks correctly at the designated levels without interference caused by `nop`.

(assert_invalid
  (module
    (func
      (block $outer
        (loop $inner
          (br $outer)
          (nop)
        )
      )
    )
  )
  "invalid branch"
)
;; - Test Description 10: Develop a series of nested loops and conditionals where some `br` instructions follow `nop` instructions. Test if the `nop` instructions cause any anomalies in resolving the branch targets, leading to unexpected loop exits or incorrect jumps.

(assert_invalid
  (module
    (func $nested-loops-conds
      (block $exit
        (loop $outer
          (nop)
          (block $inner
            (loop $inner-loop
              (br_if $exit (i32.const 0))
              (nop)
              (br_if $inner-loop (i32.const 1))
            )
          )
          (br $outer)
        )
      )
    )
  )
  "type mismatch"
)
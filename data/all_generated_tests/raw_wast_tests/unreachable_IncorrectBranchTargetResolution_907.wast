;; 8. Organize multiple layers of loops and blocks containing an `unreachable` within a deeper loop. Use `br` targeting an outer block label, and ensure the `unreachable` causes an immediate trap, not leading to incorrect jump resolution.

(assert_invalid
  (module
    (func $nested-loops-with-unreachable
      (block $outer
        (loop $inner
          (block $middle
            (br $outer)
            (unreachable)  
          )
        )
      )
    )
  )
  "type mismatch"
)
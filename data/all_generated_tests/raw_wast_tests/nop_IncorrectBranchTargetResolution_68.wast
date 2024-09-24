;; Design tests with a series of nested `loop` and `if` instructions containing `nop` and `br_table` to ensure branch targets are identified correctly and loops do not enter infinite execution due to incorrect `nop` handling.

(assert_invalid
  (module
    (func $nested_loops
      (loop $outer
        (nop)
        (if (i32.const 1)
          (then
            (loop $inner
              (nop)
              (br_table $outer $inner (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
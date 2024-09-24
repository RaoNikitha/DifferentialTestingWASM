;; 10. Build a `loop` with deeply nested blocks and interspersed `br`, `br_if`, and `br_table` instructions. Test for correct label management and branch target accuracy through complex control flows.<|vq_13476|>

(assert_invalid
  (module
    (func $deeply_nested_loops
      (block $outer
        (loop $inner1
          (block $mid
            (i32.const 0)
            (br_if $inner1)
            (loop $inner2
              (block $inner
                (i32.const 1)
                (br_if $mid)
              )
              (i32.const 2)
              (br_table $inner2 $outer $inner)
            )
            (i32.const 3)
            (br $outer)
          )
          (i32.const 4)
        )
      )
    )
  )
  "type mismatch"
)
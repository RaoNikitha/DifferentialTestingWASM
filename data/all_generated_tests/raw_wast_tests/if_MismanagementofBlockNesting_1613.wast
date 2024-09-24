;; 4. **Test for `br_table` Instruction in Nested Blocks**: Include a `br_table` within nested `if-else` blocks to evaluate if the branch tables correctly refer to the intended depth, ensuring control flow correctly exits to the appropriate outer block.

(assert_invalid
  (module
    (func $nested_br_table
      (block $outer
        (block $inner
          (br_table $outer $inner (i32.const 0))
          (if (i32.const 1)
            (then (br_table $outer $inner (i32.const 0)))
            (else (nop))
          )
        )
      )
    )
  )
  "type mismatch"
)
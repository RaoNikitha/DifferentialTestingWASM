;; 1. Test a `br` instruction within a nested loop and block structure where the target label is the outer loop. Verify if the operand stack is correctly managed and unwound at each level of nesting without losing any values to check for correct stack management and label interpretation.

(assert_invalid
  (module
    (func $nested-br-target-outer-loop
      (loop $outer_loop
        (block $inner_block
          (loop $inner_loop
            (i32.const 1)
            (br $outer_loop)
            (nop)
          )
        )
      )
    )
  )
  "type mismatch"
)
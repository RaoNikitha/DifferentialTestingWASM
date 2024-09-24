;; 6. Design a test with a `br_table` instruction embedded in an `if-else` block, where the operand evaluates the conditional jump wrongly. The default fallback should lead to an otherwise unreachable code block to see if either implementation erroneously executes the unreachable code.

(assert_invalid
  (module
    (func $wrongly-evaluated-cond
      (block $outer
        (block $inner
          (if (i32.const 1)
            (then
              (br_table 0 1 (i32.const 2))
            )
            (else
              (unreachable)
            )
          )
        )
      )
    )
  )
  "index out of bounds"
)
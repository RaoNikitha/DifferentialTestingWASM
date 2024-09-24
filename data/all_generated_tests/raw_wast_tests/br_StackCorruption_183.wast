;; 4. Test a sequence of nested loops where the `br` instruction branches to different depths in each iteration, ensuring that the inner loop does not corrupt the operand stack of outer loops.

(assert_invalid
  (module
    (func $nested-loop-br-test
      (block $outer
        (loop $inner
          (br $outer)
          (nop)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
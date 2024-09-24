;; 9. **Interleaved Loop with Conditional Branch and Return**:    Implement a function featuring interleaved loops, where each loop contains conditional branches (`br_if`). The conclusive `return` instruction must be correctly handled to avoid mismanagement of loops, demonstrating potential pitfalls in stack-polymorphic nature leading to infinite loops.

(assert_invalid
  (module
    (func $interleaved-loop-cond-branch-return (result i32)
      (local i32)
      (loop $outer
        (loop $inner
          (br_if $outer (i32.const 0))
          (return (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)
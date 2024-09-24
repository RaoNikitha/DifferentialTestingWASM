;; 2. Test a `br_if` instruction within a nested `loop` where the condition evaluates to true, ensuring the control flows back to the start of the loop. This tests whether incorrect condition evaluation leads to unintended continuation.

(assert_invalid
  (module
    (func $nested-br-if-loop
      (block $outer
        (loop $inner
          (br_if 1 (i32.const 1))
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)
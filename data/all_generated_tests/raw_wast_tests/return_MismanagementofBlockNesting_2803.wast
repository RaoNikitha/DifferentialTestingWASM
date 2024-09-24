;; 2. Create a test case with a nested loop structure where the inner loop contains a conditional branch that uses the `br_if` instruction. Use a `return` instruction following this conditional branch to assess if unwinding the stack correctly accounts for both conditions and nested loop contexts.

(assert_invalid
  (module
    (func $nested-loop-conditional-return (result i32)
      (loop $outer
        (loop $inner
          (i32.const 1)
          (br_if $outer (i32.const 0))
          (return (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
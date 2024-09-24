;; 2. **Test Description:**    - Write a function that includes several nested `loop` constructs, with `return` being called inside the innermost loop.    - The loop should manipulate the stack by pushing and popping values.    - The test verifies that the `return` instruction correctly recognises the outermost function context and exits immediately.    - **Specific Constraint:** Mismanagement of control flow within nested loops when `return` is invoked.

(assert_invalid
  (module
    (func $nested-loops-return (result i32)
      (i32.const 0)
      (loop $outer
        (i32.const 1)
        (loop $inner
          (i32.const 2)
          (return)
        )
        drop
      )
    )
  )
  "type mismatch"
)
;; 2. **Nested Loop with Multiple Returns**: Design a nested loop scenario where an inner loop conditionally returns a value that triggers stack unwinding. Ensure the `return` instruction exits both loops appropriately to avoid infinite looping in implementations.

(assert_invalid
  (module
    (func $nested-loop-return-test (result i32)
      (local i32)
      (loop $outer
        (block $inner
          (loop $inner-loop
            (local.get 0)
            (br_if $inner (i32.eqz))
            (return (i32.const 42))
          )
        )
      )
    )
  )
  "type mismatch"
)
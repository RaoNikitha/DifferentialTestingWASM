;; Implement a test with nested loops where an inner loop has a `return` instruction. Check if the `return` breaks both the inner and outer loops, preventing an infinite loop.

(assert_invalid
  (module
    (func $nested-loops-with-return (result i32)
      (i32.const 0)
      (block
        (loop
          (loop
            (br_if 1 (return (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)
;; 6. **Loop with Sequential `br` and `return` Instructions**:    Design a loop that first contains a `br` instruction to skip to the next iteration and then follows it with a `return`. This test checks if the function correctly recognizes the `return` instruction immediately post-loop, without falling back to another iteration, thereby avoiding an infinite loop scenario.

(assert_invalid
  (module
    (func $test_loop_return
      (loop
        (br 0)
        (return)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)
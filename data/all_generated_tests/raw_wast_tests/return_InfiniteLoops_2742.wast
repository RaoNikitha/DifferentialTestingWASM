;; 1. **Test Infinite Loop with Missed Conditional Return**: Create a function with a loop that should exit based on a conditional `br_if` instruction checking a stack value. Verify if the `return` instruction afterward correctly unwinds the stack and returns the expected result where WebAssembly might miss conditional checks due to stack unmatching.

(assert_invalid
  (module
    (func $test_loop (param i32) (result i32)
      (block $outer (result i32)
        (loop $inner
          (i32.const 0)
          (br_if $outer)
          (return (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)
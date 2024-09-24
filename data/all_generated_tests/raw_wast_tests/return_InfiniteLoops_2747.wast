;; 6. **Return within a Loop using Function Call**: Have a loop that triggers a nested function with a `return` instruction. Ensure proper unwind of the operand stack across function calls and avoid infinite loops from function returns not properly collapsing the outer loop.

(assert_invalid
  (module
    (func $nested-return-loop
      (loop
        (call $func-with-return)
        (br 0)
      )
    )
    (func $func-with-return (result i32)
      (return (i32.const 1))
    )
  )
  "type mismatch"
)
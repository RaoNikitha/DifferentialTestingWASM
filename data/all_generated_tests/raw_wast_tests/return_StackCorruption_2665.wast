;; 4. Create a function that includes an early `return` before manipulating the operand stack heavily. This tests whether the `return` instruction can unwind the stack correctly when it occurs early in the function execution, ensuring no intermediate stack values cause corruption.

(assert_invalid
  (module
    (func $early-return-with-unwind (result i32)
      (i32.const 1)
      (return)
      (i32.const 2)
    )
  )
  "type mismatch"
)
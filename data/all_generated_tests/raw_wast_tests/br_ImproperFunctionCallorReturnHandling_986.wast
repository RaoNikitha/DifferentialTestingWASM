;; 7. **Test: Loop Function Call with Multiple Breaks**    - **Description**: Design a loop that houses multiple function calls, each with its `br` instruction targeting various outer contexts. Examine stack consistency and operand handling.    - **Constraint Checked**: Ensures valid execution of loops with multiple breaks and function calls.    - **Improper Handling Aspect**: Misaddressing of labels or incorrect stack unwinding while breaking from multiple points in the loop.

(assert_invalid
  (module
    (func $loop-function-call-with-multiple-breaks
      (block $outer
        (loop $inner
          (call $dummy_function)
          (br $outer)
          (call $dummy_function)
          (br $inner)
          (call $dummy_function)
        )
      )
    )
    (func $dummy_function)
  )
  "type mismatch"
)
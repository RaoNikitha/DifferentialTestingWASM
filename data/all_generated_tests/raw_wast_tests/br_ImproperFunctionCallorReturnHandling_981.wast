;; 2. **Test: Function Call Within Nested Loop**    - **Description**: Implement a nested loop with a function call inside the inner loop. The function called should contain a `br` instruction that incorrectly assumes a return to an outer loop context with mismatched operand types.    - **Constraint Checked**: Checks the operand stack management within nested control structures and ensures correct label target referencing.    - **Improper Handling Aspect**: Incorrect unwinding of the stack when returning to outer loop contexts following a function call.

(assert_invalid
  (module
    (func $nested-loop-invocation
      (local $0 i32)
      (block $outer
        (loop $inner
          (call $invalid_branch) ;; Call a function containing an invalid branch
          br $inner
        )
      )
    )
    (func $invalid_branch (br 1)) ;; Incorrect assumption about the label context
  ))
  "unknown label"
)
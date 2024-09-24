;; 5. **Test Description**: A `loop` with a `call` instruction that performs a return, testing if the return from the function correctly resumes the loop execution.    - **Constraint**: Checks for proper resumption of execution flow after a function call and return within a loop.    - **Improper Handling**: Incorrect handling of return values affecting the continuation of loop execution post function return. -

(assert_invalid
  (module
    (func $resume_loop_after_call
      (loop (param i32) (call $some_function) (br 0))
    )
    (func $some_function (param) (result)
      (return)
    )
  )
  "type mismatch"
)
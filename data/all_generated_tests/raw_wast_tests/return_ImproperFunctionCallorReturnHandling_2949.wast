;; 8. **Function Returning with Loop Continuation**:    Implement a function that includes a loop, and within the loop, it conditionally returns. Ensure that the stack unwinding correctly matches the return values required by the function type after incorrectly popping values within the loop.

(assert_invalid
  (module
    (func $function-returning-loop-continuation (result i32)
      (loop
        (i32.const 1)
        (if (i32.eqz (i32.const 0))
          (then (return (i32.const 42)))
        )
        (drop)
      )
    )
  )
  "type mismatch"
)
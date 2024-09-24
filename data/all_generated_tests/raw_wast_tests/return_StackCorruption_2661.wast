;; 10. **Test 10: Early Function Termination with Exception Handling**     - Have a function that includes exception handling (`try`/`catch`) with an early `return` inside `try`. Verify if exceptions caught later affect stack unwinding.     - *Related Constraint*: Checks exception handling interaction with `return` and stack restoration.

(assert_invalid
  (module
    (func $test-early-return-with-try-catch (result i32)
      (try (result i32)
        (do 
          (i32.const 1)
          (return)
        )
        (catch
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)
;; 9. **Test: Function Throwing Exceptions in Loop**     - Description: Implement a loop instruction that includes a function call which might throw an exception. Check how the loop handles exceptions and whether it continues, breaks or terminates as per the exception handling mechanism.     - Constraint: Validates loop control flow integrity when exceptions occur during function calls.

(assert_invalid
  (module (func $exception_in_loop
    (loop (result i32)
      (call $throw_exception)
      (br 0)
    )
  (func $throw_exception (result i32)
    (i32.const 1) (throw)
  ))
  "Unhandled exception"
)
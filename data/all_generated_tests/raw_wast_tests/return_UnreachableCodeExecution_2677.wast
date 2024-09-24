;; **Test 6**: Create a try-catch block where a `return` is placed in the try block and `unreachable` immediately follows. Any error should go to the catch block, and normal execution should hit `return`. *Constraint Checking*: Tests exception handling and confirms correct function termination within try-catch blocks.

(assert_invalid
  (module
    (func $check-try-catch (result i32)
      (i32.const 0)
      (try (result i32)
        (do (return))
        (catch_all (unreachable))
      )
    )
  )
  "type mismatch"
)
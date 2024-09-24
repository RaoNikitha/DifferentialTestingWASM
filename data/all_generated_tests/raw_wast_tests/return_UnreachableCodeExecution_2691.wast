;; Test 10: Introduce try-catch blocks where the try block has an `unreachable` at the end but with various return calls inside; ensure returning from try avoids any catch block leading to `unreachable` within the catch code.

(assert_invalid
  (module
    (func $test-try-catch (result i32)
      (try (result i32)
        (do
          (return (i32.const 10))
          (unreachable)
        )
        (catch (unreachable))
      )
    )
  )
  "type mismatch"
)
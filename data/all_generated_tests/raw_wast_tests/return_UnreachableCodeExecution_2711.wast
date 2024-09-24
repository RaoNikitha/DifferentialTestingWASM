;; Test 10: Implement a function that performs transactional tasks, ends with `return` within catch block, placing `unreachable` outside. Reason: Tests exception handling integration with `return`; improper return will reach `unreachable`.

(assert_invalid
  (module
    (func $test-return-in-catch
      (try
        (do
          (call $someFunction)
        )
        (catch
          (return)
        )
      )
      (unreachable)
    )
    (func $someFunction)
  )
  "type mismatch"
)
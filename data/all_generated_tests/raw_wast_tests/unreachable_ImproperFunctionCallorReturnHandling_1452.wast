;; 3. Implement a function that starts with an `unreachable` and ends with a `return`. Call this function and test if the return instruction is never reached due to the trap.

(assert_invalid
  (module
    (func $unreachable-test-with-return
      (unreachable)
      (return)
    )
  )
  "unreachable code"
)
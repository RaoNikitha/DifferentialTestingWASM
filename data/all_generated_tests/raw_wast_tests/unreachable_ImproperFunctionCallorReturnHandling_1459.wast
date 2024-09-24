;; 10. In a function, add an `if` statement where the true branch contains an `unreachable` and a `call` and the false branch leads to a return. Verify that when the true branch is taken, the trap caused by `unreachable` prevents the call and the function does not return.

(assert_invalid
  (module (func $differential_test_if_unreachable_call
    (result i32)
    (if (result i32)
      (i32.const 1)
      (then (unreachable) (call $some_function))
      (else (return (i32.const 0)))
    )
  ))
  "type mismatch"
)
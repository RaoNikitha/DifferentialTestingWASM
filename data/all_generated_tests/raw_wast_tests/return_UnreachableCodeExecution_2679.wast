;; **Test 8**: Include a function call that contains a `return` within its body and place an `unreachable` instruction immediately after the call in the caller function. Proper function call and return handling should prevent `unreachable` from being executed. *Constraint Checking*: Tests function call returns and confirms control flow does not proceed past `return`.

(assert_invalid
  (module
    (func $test
      (call $inner)
      unreachable
    )
    (func $inner
      (return)
      i32.const 0
    )
  )
  "type mismatch"
)
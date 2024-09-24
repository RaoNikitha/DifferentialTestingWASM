;; A test with an `if` block that terminates with a `call` to a function and an `else` part directly terminating (no function call), ensuring the stack state consistency and return values are properly managed without blocktype mismatch errors.

(assert_invalid
  (module
    (func $func1 (result i32) (i32.const 1))
    (func $test (result i32)
      (if (result i32)
        (then (call $func1))
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)
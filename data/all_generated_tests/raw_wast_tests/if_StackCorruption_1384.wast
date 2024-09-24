;; 5. Use an `if` instruction where the `then` block performs multiple `call` instructions to different functions with varying stack usage. Examine the integrity of the operand stack post-`if` block execution across implementations.

(assert_invalid
  (module (func $diff_test_if_call_stack
    (if (result i32) (i32.const 1)
      (then
        (call $someFunc)
        (call $someOtherFunc)
      )
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)
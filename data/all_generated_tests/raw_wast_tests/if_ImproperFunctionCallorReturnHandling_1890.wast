;; 1. **Test Incorrect Return Value Handling in if Branch**:    Create a function with a nested `if` structure where the `then` block makes a function call that returns a value. Ensure the value returned is utilized inside the `if` block's continuation flow.

(assert_invalid
  (module (func $incorrect_return_if (result i32)
    (if (result i32) (i32.const 1)
      (then (call 0))
      (else (call 0))
    )
  ))
  "type mismatch"
)
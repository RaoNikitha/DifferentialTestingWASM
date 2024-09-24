;; 1. **Test: Conditional Branch with Function Call Inside Loop**    - **Description:** Create a loop that calls a function based on a condition evaluated in `br_if`. Ensure the function modifies the operand stack. Verify that stack unwinding and function return values are handled correctly upon exiting the loop.    - **Constraint Check:** Ensures consistent operand stack unwinding across different implementations and that the return values are correctly propagated through the `br_if`.

(assert_invalid
  (module (func $test-loop-function-call
    (block $outer (loop $inner
      (call $modify-stack) 
      (br_if $outer (i32.const 1))
      (br_if $inner (i32.const 0))
    ))
    (func $modify-stack (i32.const 42) drop)
  ))
  "unreachable code"
)
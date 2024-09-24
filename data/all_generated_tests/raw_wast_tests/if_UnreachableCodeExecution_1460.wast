;; 1. Create a test where an `if` condition directly follows an `unreachable` instruction. Validate that the `unreachable` causes the control flow to trap before evaluating the `if` condition, ensuring the stack type constraints are enforced.

(assert_invalid
  (module (func $unreachable-if-condition
    unreachable
    if (result i32) (i32.const 1) (then (i32.const 1)) (else (i32.const 0)) end
  ))
  "unreachable executed"
)
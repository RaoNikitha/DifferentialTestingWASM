;; Test 10: Implement an `if` instruction that incorrectly manages the operand stack by popping off an `i32` type, but the block type actually expects the `if` to evaluate an `f32` condition.

(assert_invalid
  (module (func $invalid-stack-management
    (if (result i32) (f32.const 1.0)
      (then (i32.const 42))
    )
  ))
  "type mismatch"
)
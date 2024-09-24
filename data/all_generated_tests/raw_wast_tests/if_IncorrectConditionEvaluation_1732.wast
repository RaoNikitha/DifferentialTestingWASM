;; 3. **Edge Case Condition (Zero Evaluation)**: Design a test where the condition explicitly evaluates to zero, ensuring the `else` block is executed. Check if one implementation mistakenly enters the `then` block despite the zero condition.

(assert_invalid
  (module (func $edge-case-zero-evaluation (result i32)
    (if (result i32) (i32.const 0) (then (i32.const 42)) (else (i32.const 0)))
  ))
  "type mismatch"
)
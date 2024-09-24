;; 1. **Test Description**: Test an `if` block with a condition that should evaluate to false. No instructions should execute, and the final result should reflect the `else` block's output only. This checks if the condition evaluation skips to the `else` block correctly.

(assert_invalid
  (module (func $if-false-condition (result i32)
    (i32.const 0)
    (if (result i32)
      (then (unreachable))
      (else (i32.const 42))
    )
  ))
  "type mismatch"
)
;; 6. **Test: Conditional Execution and Unreachable**    - Use `if (condition)` blocks where true/false paths lead to `unreachable` and valid instructions subsequently.    - **Stack Corruption Check:** This will check if the conditional paths manage stack transitions correctly without corruption.

(assert_invalid
  (module (func
    (if (i32.const 1) (then (unreachable)) (else))
    (i32.const 1)
    (drop)
  ))
  "type mismatch"
)
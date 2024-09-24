;; 5. **Unmatched Stack Height**:    - **Focus**: Stack height consistency.    - **Description**: Make the `then` and `else` blocks manipulate the stack so that they leave different stack heights when they finish. Ensure that the system identifies the inconsistency.

(assert_invalid
  (module (func $unmatched-stack-height
    (if (result i32)
      (i32.const 1)
      (then (i32.const 1) (drop))
      (else (i32.const 1) (i32.const 1))
    )
  ))
  "type mismatch"
)
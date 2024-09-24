;; 9. **Incorrect Output Types**:    - **Focus**: Output type consistency.    - **Description**: Ensure that the result type of the instructions inside the `if` or `else` does not match the expected block type. Verify stack type handling and error detection.

(assert_invalid
  (module (func $incorrect-output-type (result i32)
    (if (result i32) (i32.const 1) (then (i64.const 1)) (else (i64.const 1)))
  ))
  "type mismatch"
)
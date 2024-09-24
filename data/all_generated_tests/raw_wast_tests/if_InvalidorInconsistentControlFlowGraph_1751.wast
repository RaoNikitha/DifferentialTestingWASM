;; 2. **Test `if` Block with Mismatched `else` Result Types**:    - Use an `if` block where the `else` branch returns a different type than the `then` branch, expecting validation to catch this inconsistency.    - **Constraint Checked**: verifies that the CFG maintains strict type matching between `then` and `else`.

(assert_invalid
  (module (func $type-mismatched-else-result (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 0)) (else (nop)))
  ))
  "type mismatch"
)
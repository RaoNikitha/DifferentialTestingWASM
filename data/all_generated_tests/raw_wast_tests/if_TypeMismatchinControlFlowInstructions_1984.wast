;; 5. **Test Description**:    - Implement an `if` block type that expects an input of `[i64, i32] -> [i32]`, then ensure the `else` branch produces an `i64` output.    - **Constraint Checked**: Mismatched output type of `else` branch (`i64`) compared to expected `i32`.    - **Target**: Evaluate if the system identifies and handles type violations effectively within the control flow.

(assert_invalid
  (module
    (func $differential_test
      (i64.const 0) (i32.const 0)
      (if (result i32) (then (i32.const 1)) (else (i64.const 1)))
    )
  )
  "type mismatch"
)
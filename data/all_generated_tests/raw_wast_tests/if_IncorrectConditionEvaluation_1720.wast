;; - Test a scenario where the `if` condition checks a `zero` value (i32.const 0) and ensure it correctly bypasses to the `else` block, verifying that the `false` branch is correctly identified in both interpreters.

(assert_invalid
  (module (func $if-zero-condition-check (result i32)
    (if (result i32) (i32.const 0)
      (then (i32.const 1))
      (else (i32.const 2) (i32.const 3))
    )
  ))
  "type mismatch"
)
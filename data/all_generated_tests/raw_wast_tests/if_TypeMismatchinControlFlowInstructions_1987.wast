;; 8. **Test Description**:    - Design an `if` block with an expected stack transition `[f32] -> [i64]`, but let the `then` branch output a `f64`.    - **Constraint Checked**: Type mismatch where the `then` branch produces an `f64` instead of `i64`.    - **Target**: Ensure that type violations within nested branches are correctly identified and handled.

(assert_invalid
  (module (func $type-mismatch-if-then-branch (result i64)
    (f32.const 0.0)
    (if (result i64)
      (then (f64.const 1.0))
      (else (i64.const 0))
    )
  )) 
  "type mismatch"
)
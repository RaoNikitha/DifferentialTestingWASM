;; 6. **Test Description**: Test `br_if` with a condition that evaluates to true, but stack types at branch target mismatched.    - **Constraint Checked**: Validates both correct conditional evaluation and type matching after condition is true.    - **Incorrect Condition Evaluation**: A condition might be correctly true, but type checks could fail.

(assert_invalid
  (module
    (func $br_if_cond_true_type_mismatch
      (block (result i32)
        (if (i32.const 1) (then (br_if 0 (i32.const 1))) (else (i32.const 0)))
      )
    )
  )
  "type mismatch"
)
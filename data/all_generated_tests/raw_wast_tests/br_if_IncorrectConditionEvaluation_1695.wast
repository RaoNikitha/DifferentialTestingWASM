;; 6. **Test Br_if with Zero Condition**:    - **Description**: Execute a `br_if` with a condition value of zero and validate no branching occurs.    - **Constraint**: A zero condition should continue normal execution.    - **Incorrect Condition Evaluation**: Even with a zero condition, the `br_if` takes the branch, executing incorrect code paths.

(assert_invalid
  (module
    (func $test-br_if-zero-condition
      (block
        (i32.const 0)
        (br_if 0 (i32.const 0))
        (i32.const 1) (drop)
      )
    )
  )
  "expected stack height mismatch after br_if with zero condition"
)
;; 8. **Boundary Condition Checks**:    - Test boundary conditions (e.g., zero/non-zero checks) in `br_if` leading to return. Validate if small deviations or incorrect evaluations in checking conditions result in improper returns.

(assert_invalid
  (module
    (func $boundary-condition-check (result i32)
      (i32.const 0)
      (br_if 0 (return))
    )
  )
  "type mismatch"
)
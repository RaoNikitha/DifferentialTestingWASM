;; 8. **Test Description**: Test a deeply nested `br_if` where different levels have disparate stack expectations.    - **Constraint Checked**: Ensures correct relative label indexing and stack management.    - **Incorrect Condition Evaluation**: Mislabeling or stack mismanagement could cause inappropriate branching behavior.

(assert_invalid
  (module (func $nested-label-stack (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_if 3 (i32.const 1))
            (i32.const 0)  ; This should not be reached
          )
          (i32.const 2)
        )
        (i32.const 3)
      )
      (i32.const 4)
    )
  ))
  "type mismatch"
)
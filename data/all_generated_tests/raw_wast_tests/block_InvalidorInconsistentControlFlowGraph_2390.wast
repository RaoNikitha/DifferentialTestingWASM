;; 1. **Test a deeply nested block with incorrect forward branching within the innermost block**:    - **Constraint Checked**: Ensures that the label stack properly manages deeply nested block scenarios.    - **Reasoning**: Testing improper forward branching will check if labels are handled correctly when deeply nested.

(assert_invalid
  (module (func $deep-nested-block-invalid-branch
    (block (result i32)
      (block
        (block
          (block
            (br 2)
          )
        )
      )
      (i32.const 0)
    )
  ))
  "type mismatch or invalid branch"
)
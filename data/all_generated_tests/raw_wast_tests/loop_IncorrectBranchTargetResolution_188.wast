;; 9. **Loops with Conditional Branching Errors**:    - **Description**: Test conditional branching within loops where `br_if` incorrectly targets outer blocks due to an incorrect context extension during validation.    - **Constraint**: Validating the context correctly reflects the branch targets and conditions.

(assert_invalid
  (module
    (func (loop (result i32)
      (block
        (br_if 1 (i32.const 0))
        (i32.const 1)
        (loop (result i32)
          (br_if 2 (i32.const 1))
          (i32.const 2)
        )
      )
    ))
  )
  "type mismatch"
)
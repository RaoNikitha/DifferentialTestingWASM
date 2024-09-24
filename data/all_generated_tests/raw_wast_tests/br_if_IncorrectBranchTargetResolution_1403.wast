;; 4. **Test Description**: Use multiple `if` branches with `br_if` instructions, targeting alternating branches. Ensure that branches correctly resolve to target labels.    - **Constraint Checked**: Validation of nested labels in conditional structures.    - **Related Issue**: Proper label resolution when `if` structures are involved.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (then (br_if 0 (i32.const 0) (i32.const 2)))
        (else (br_if 1 (i32.const 1) (i32.const 3)))
      )
    )
  )
  "type mismatch"
)
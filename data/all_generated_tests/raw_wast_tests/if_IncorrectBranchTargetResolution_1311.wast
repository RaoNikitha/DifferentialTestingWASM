;; 2. **Test: Incorrect Label Index**:    - **Description**: Use a `br` within an `if` block that targets `label 1`, but `label 1` does not exist in the current or any outer block context.    - **Constraint**: This forces the implementation to check correct label availability and scope.    - **Relation to Branch Target Resolution**: Validates if the label is correctly resolved within nested `if` structures.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (br 1)
        )
        (else
          (i32.const 2)
        )
      )
    )
  )
  "unknown label"
)
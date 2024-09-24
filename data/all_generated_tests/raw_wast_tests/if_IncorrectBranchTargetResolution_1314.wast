;; 5. **Test: Valid Label but Incorrect Context**:    - **Description**: Use an `if` statement where a `br` references a valid label that exists but is not within the valid scope of the immediate `if` block.    - **Constraint**: Validates the label's contextual scope for branches within `if`.    - **Relation to Branch Target Resolution**: Examines the resolver’s accuracy in differentiating valid scopes for labels.

(assert_invalid
  (module
    (func $valid-label-incorrect-context
      (block (i32.const 1) (if (i32.const 0) (then (br 1)) else (nop)))
    )
  )
  "invalid label"
)
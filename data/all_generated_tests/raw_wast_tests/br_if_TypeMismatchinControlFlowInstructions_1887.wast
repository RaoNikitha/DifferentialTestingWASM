;; 8. **Test Case 8**:    - **Description**: Design an `if-else` structure with `i32` type handling, using `br_if` in both branches to conditionally jump, but introduce an `i64` type operand incorrectly in one of the branch conditions.    - **Constraint**: Validates type constraints within conditional branching scenarios, ensuring stacked types adhere to the annotated types in `if-else` blocks.

(assert_invalid
  (module
    (func $type-mismatch-if-else
      (block
        (if
          (then
            (br_if 0 (i64.const 0))
          )
          (else
            (br_if 0 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)
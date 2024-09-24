;; 6. **Test Name: `br_table` in an Unreachable Block**    - **Description**: The `if` block initially sets up a state to reach a known `unreachable` point, followed by a `br_table`. This scenarios checks error handling for `br_table` in unreachable contexts.    - **Constraint Checked**: Unreachable instruction handling within control flows involving indirect branches.    - **Relation to Edge Case**: Ensures proper trapping and error identification in unreachable code paths.

(assert_invalid
  (module (func $br_table-unreachable-in-if
    (if (i32.const 1)
      (then
        (unreachable)
        (br_table 0 0 (i32.const 0))
      )
    )
  ))
  "unreachable code"
)
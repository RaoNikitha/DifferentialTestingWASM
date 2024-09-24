;; 8. **Test 8**:    - **Description**: Construct an `if` block with an `unreachable` call inside a function, verifying the handling of traps during function returns.    - **Constraint**: Ensure that the execution correctly traps and stops upon hitting the `unreachable` function, without altering the control flow incorrectly.    - **Relation**: Ensures correct trap handling within functions called in `if` blocks, managing improper exits effectively.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then (unreachable))
      )
    )
  )
  "type mismatch"
)
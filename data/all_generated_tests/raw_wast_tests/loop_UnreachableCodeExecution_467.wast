;; 8. **Multiple Unreachables within Loop**:    - **Description**: Design a loop containing several `unreachable` instructions at different control points within the loop body.    - **Constraint Checked**: Validates multiple unreachable points handling within a loop’s execution path.    - **Unreachable Execution Check**: Ensures that reaching any unreachable instruction in different branches of the loop causes the expected trap.

(assert_invalid
  (module
    (func $multiple-unreachables-in-loop
      (loop (result i32)
        (unreachable)
        (i32.const 42)
        (br 0)
        (unreachable)
        (loop (result i32)
          (br 1)
          (unreachable)
        )
      )
    )
  )
  "unreachable"
)
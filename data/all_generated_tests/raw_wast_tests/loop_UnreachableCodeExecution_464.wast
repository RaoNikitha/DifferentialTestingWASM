;; 5. **Loop Block Ending with Unreachable**:    - **Description**: Design a loop whose entire body ends with an unreachable instruction.    - **Constraint Checked**: Tests if loop termination correctly recognizes unreachable endings.    - **Unreachable Execution Check**: Ensures that the control flow never escapes the loop reaching the end, leading directly to an unreachable trap.

(assert_invalid
  (module
    (func (loop (result i32)
      unreachable
    ))
  )
  "unreachable instruction"
)
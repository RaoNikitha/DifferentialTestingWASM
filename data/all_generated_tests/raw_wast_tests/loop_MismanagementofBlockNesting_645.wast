;; 6. **Test: Loop with Exiting Branch**    - **Description**: Loop with a branch that exits the loop to an enclosing block with multiple targets.    - **Constraint Being Checked**: Exiting from loop and properly unwinding to outer block.    - **Mismanagement**: Improper unwinding may skip or repeat loop exit.

(assert_invalid
  (module
    (func (block $exit (loop $loop (br 1) (br $loop))) (unreachable))
  )
  "type mismatch"
)
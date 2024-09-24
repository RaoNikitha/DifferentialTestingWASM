;; 9. **Early Exit to Unreachable Instruction**:    - **Description**: Create a loop with an immediate `br` leading to the end of the block which contains an unreachable instruction.    - **Constraint Checked**: Ensures early exits respect unreachable instructions at the loop’s end block.    - **Unreachable Execution Check**: Checks the trap occurs as expected on early loop exit paths to unreachable.

(assert_invalid
  (module
    (func (loop (br 1) unreachable))
  )
  "unreachable executed"
)
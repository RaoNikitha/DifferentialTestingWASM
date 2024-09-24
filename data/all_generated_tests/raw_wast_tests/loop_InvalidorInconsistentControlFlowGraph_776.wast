;; 7. **Loop with Invalid Indirect Branch**:    - **Description**: Test a loop containing a `br_table` instruction with an operand that is out of bounds for the label vector.    - **Constraint Checked**: Ensures that indirect branches handle default targets correctly.    - **Relation to CFG**: Incorrect handling can lead to invalid branches and disrupt the CFG.

(assert_invalid
  (module
    (func $loop-invalid-indirect-branch
      (loop (result i32) (i32.const 0) (br_table 1 0 (i32.const 0)))
    )
  )
  "unknown label"
)
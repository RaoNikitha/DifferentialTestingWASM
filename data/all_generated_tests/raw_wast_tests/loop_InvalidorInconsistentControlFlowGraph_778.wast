;; 9. **Loop with Early Exit**:    - **Description**: Test a loop with an early exit through a `br` instruction, followed by code that relies on the loop's continuation.    - **Constraint Checked**: Ensures that branches correctly jump to the intended loop start point.    - **Relation to CFG**: Incorrect jumps can create unreachable code paths and disrupt loop continuity in the CFG.

(assert_invalid
  (module (func $loop_with_early_exit (result i32)
    (i32.const 10)
    (loop (result i32)
      (br 1)
      (i32.const 20)
    )
    (i32.const 30)
  ))
  "type mismatch"
)
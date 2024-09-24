;; 4. **Test for Nested Loop Branching with False Condition**    - **Description**: Create nested loops where an inner loop contains a `br_if` instruction with a condition that should be false. The outer loop verifies whether the inner loop continues execution without branching.    - **Constraint Checked**: Verifies correct branching behavior in nested loops with false conditions.    - **Incorrect Condition Evaluation**: Ensures `br_if` inside inner loop does not incorrectly branch to outer loop.

(assert_invalid
  (module
    (func $nestedLoopBranchingFalseCondition
      (i32.const 0)
      (loop (result i32)
        (i32.const 1)
        (loop (result i32)
          (i32.const 0)
          (br_if 0)
          (br 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
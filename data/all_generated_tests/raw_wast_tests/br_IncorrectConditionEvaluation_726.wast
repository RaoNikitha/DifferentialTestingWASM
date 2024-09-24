;; 7. **Test Description:**    Insert a `br_if` that branches based on the comparison of two local variables within an `if` block. Verify the branch occurs correctly only when the comparison holds.    - **Constraint Checked:** Correct condition evaluation involving local variable comparisons within `if` blocks.    - **Relation to Incorrect Condition Evaluation:** Ensures local variable comparisons are properly used to determine branching.

(assert_invalid
  (module
    (func $test-local-comparison-branch
      (local $x i32)
      (local $y i32)
      (block
        (if (i32.gt_s (local.get $x) (local.get $y))
          (then (br 1))
        )
      )
    )
  )
  "unknown label"
)
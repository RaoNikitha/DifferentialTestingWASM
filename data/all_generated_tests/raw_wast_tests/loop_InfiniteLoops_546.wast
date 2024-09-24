;; 7. **Test Description**: Create a loop with multiple branches (`br`, `br_if`) inside the loop but configure contexts incorrectly such that the intended loop exit conditions are never met.    **Constraint Checked**: Accurate management and validation of label contexts.    **Relation to Infinite Loops**: Ensures label context handling does not cause improper condition checks leading to infinite loops.

(assert_invalid
  (module (func $complex-loop (result i32)
    (loop (result i32)
      (block (br 1))
      (if (i32.const 1) (then (br 0)))
      (unreachable)
    )
  ))
  "context management"
)
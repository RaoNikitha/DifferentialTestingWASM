;; 1. **Test: Simple Nested Loops**    - **Description**: Test a nested loop where an inner loop is nested within an outer loop. Use branching to the beginning of both loops.    - **Constraint Being Checked**: Proper label indexing and branch targeting.    - **Mismanagement**: Incorrect branch might exit the wrong loop.

(assert_invalid
  (module (func $nested-loops
    (block (loop (block (loop (br 1))) (br 0)))
  ))
  "label targeting mismanagement"
)
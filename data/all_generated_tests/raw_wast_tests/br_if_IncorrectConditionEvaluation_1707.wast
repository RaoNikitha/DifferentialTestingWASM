;; 8. **Test Description**: Construct a scenario with a `br_if` inside a nested loop, where the condition is dynamically determined by a previous arithmetic operation. Verify branching behavior with different arithmetic results.    - **Constraint Checked**: Evaluates correctly conditioned branching based on dynamic arithmetic results.    - **Relation to Incorrect Evaluation**: Determines if `br_if` condition handling fails when influenced by preceding calculations.

(assert_invalid
  (module
    (func $dynamic-arith-branch
      (loop $outer
        (i32.const 5)
        (i32.const 3)
        (i32.add)
        (br_if $outer (i32.const 1))
      )
    )
  )
  "unknown label"
)
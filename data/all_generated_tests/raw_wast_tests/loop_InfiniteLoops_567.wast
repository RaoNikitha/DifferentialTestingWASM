;; 8. **Test Name: Immediate Infinite Loop via Br**    - **Description**: Use a loop where an immediate `br` at the loop beginning causes an infinite loop.    - **Constraint Checked**: Handling of immediate branch instructions leading back to loop start.    - **Infinite Loop Relation**: The loop reinitializes directly on the first iteration.

(assert_invalid
  (module
    (func $immediate-infinite-loop
      (loop $infinite (br $infinite))
    )
  )
  "unreachable code"
)
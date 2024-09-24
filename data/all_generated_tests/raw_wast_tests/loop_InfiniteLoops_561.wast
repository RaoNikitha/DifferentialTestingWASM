;; 2. **Test Name: Conditional Infinite Loop**    - **Description**: Use a loop with a conditional branch instruction (`br_if`) that always evaluates to true, ensuring the loop replays infinitely.    - **Constraint Checked**: Validation of `br_if` with constant true condition should lead to an infinite loop.    - **Infinite Loop Relation**: The loop will not end as the condition for `br_if` always holds true.

(assert_invalid
  (module (func $conditional-infinite-loop
    (loop (result i32)
      (block (result i32)
        (br_if 0 (i32.const 1))
        (unreachable)
      )
    )
  ))
  "infinite loop"
)
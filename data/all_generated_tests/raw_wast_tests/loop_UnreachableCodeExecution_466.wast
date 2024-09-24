;; 7. **Unreachable Condition in Loop Condition**:    - **Description**: Implement a loop where the condition evaluation includes an unreachable instruction before deciding a `br_if` in the loop.    - **Constraint Checked**: Verifies conditions/checkpoints within loops handle unreachable outcomes correctly.    - **Unreachable Execution Check**: Ensures when the condition evaluates to reach `unreachable`, it traps as expected causing termination.

(assert_invalid
  (module (func $unreachable-loop-cond
    (loop (br_if 0 (unreachable)))
  ))
  "unreachable executed"
)
;; 8. **Test for Loop with Multiple `br_if` Instructions on Sequential Conditions**    - **Description**: Insert multiple `br_if` instructions evaluating sequentially set local variables within a single loop to ensure each condition is correctly evaluated in sequence.    - **Constraint Checked**: Validates the correctness and sequence of conditional evaluations.    - **Incorrect Condition Evaluation**: Checks if the sequence of evaluations is disrupted, causing wrong branches.

(assert_invalid
  (module
    (func $loop-multiple-br_if (result i32)
      (local i32)
      (i32.const 1)
      (set_local 0)
      (loop (result i32)
        (get_local 0)
        (i32.const 1)
        (i32.eq)
        (br_if 1)
        (i32.const 0)
        (set_local 0)
        (get_local 0)
        (i32.const 0)
        (i32.eq)
        (br_if 1)
        (get_local 0)
      )
      (get_local 0)
    )
  )
  "type mismatch"
)
;; 6. **Loop with Early Exit**:    - Description: Create a loop where the first instruction is a `br_if` that conditionally exits the loop. Check if the loop is correctly skipped based on the branch condition.    - Reasoning: Validates branch resolution when attempting an early exit from the loop.

(assert_invalid
  (module (func $early-exit-loop
    (loop (result i32)
      (i32.const 1)
      (br_if 1 (i32.const 0))
      (i32.const 2)
    )
  ))
  "type mismatch"
)
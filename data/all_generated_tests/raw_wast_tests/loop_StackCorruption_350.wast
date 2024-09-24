;; 1. **Test for Mismatched Stack Heights After Loop Execution**:    - Run a loop that pushes a fixed number of values onto the stack. After the loop terminates, check if the stack height matches the expected value.    - **Constraint**: Ensuring the stack unwinding and rewinding correctly during each iteration.    - **Relation to Stack Corruption**: If the loop does not manage the stack height properly, it could leave extra or missing values, leading to stack corruption.

(assert_invalid
  (module
    (func $mismatched-stack-height-loop
      loop (result i32)
        (i32.const 1) (i32.const 2) (i32.const 3)
        br 0
      end
      (drop) (drop)
    )
  )
  "type mismatch"
)
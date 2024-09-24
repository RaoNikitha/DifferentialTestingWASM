;; 7. **Backward Branch in Nested Loop**:    - **Description**: Introduce nested `loop` structures where a `br_if` designates the outer loop from an inner loop, inducing a backward jump. This tests proper stack unwinding and resume at `loop` start.    - **Constraint Checked**: Backward Branching, Operand Stack.    - **Expected Failure**: The wizard_engine might not properly handle the nested backward jump, leading to possible `OobLabel` or stack-related errors.

(assert_invalid
  (module (func $backward-branch-in-nested-loop
    (loop (block (loop (br_if 1 (i32.const 1)) (br 0))))
  ))
  "type mismatch"
)
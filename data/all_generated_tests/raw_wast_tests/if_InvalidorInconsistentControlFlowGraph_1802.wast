;; 3. **Test Name**: `else` Block with Inconsistent Operand Stack    **Description**: Construct an `if-else` block where the `else` block manipulates the stack differently than the `if` block, leading to an inconsistent stack state.    **Constraints Checked**: Operand stack consistency between `if` and `else`.    **CFG Issue**: Detects misalignment in operand stacks causing invalid control flow.

(assert_invalid
  (module (func $else-inconsistent-stack (result i32)
    (if (result i32)
      (then (i32.const 1))
      (else (i64.const 1))
    )
  ))
  "type mismatch"
)
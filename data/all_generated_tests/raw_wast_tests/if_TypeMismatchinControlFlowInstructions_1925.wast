;; 6. **Inconsistent Branch Result Types**:    - Execute an `if` block where the `then` branch's instructions comply with the block type, but the `else` branch does not match the result type.    - This checks if both branches of the `if` block consistently match the block type.    - **Constraint**: The result types of the `then` and `else` branches must exactly match the block type's result type.

(assert_invalid
  (module (func $inconsistent-branch-result-types (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
      (else (nop))
    )
  ))
  "type mismatch"
)
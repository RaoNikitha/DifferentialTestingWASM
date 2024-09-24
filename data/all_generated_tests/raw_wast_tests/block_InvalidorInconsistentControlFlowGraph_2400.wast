;; ### Differential Test Descriptions for Invalid or Inconsistent Control Flow Graph  1. **Inconsistent Stack State Inside Block**:    - Test a block where the operand stack state at the beginning does not match the expected result stack state at the end.    - This checks how each engine handles mismatched block entry and exit state requirements, specifically with result type adherence.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (i32.const 42)
      (i64.const 17)
    )
    (drop)
  ))
  "type mismatch"
)
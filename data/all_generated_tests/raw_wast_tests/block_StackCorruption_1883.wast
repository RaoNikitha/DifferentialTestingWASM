;; 4. **Unwinding Stack Incorrectly on Branch**:    - Description: Create a block where a branch instruction incorrectly restores the stack to the height it was before block entry.    - Constraint: Operand stack unwinding upon branching.    - Reasoning: Differing implementations may handle stack unwinding incorrectly, leading to improper operand states and stack corruption.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (i32.const 10)
      (br 0)
      (i32.add (i32.const 5) (i32.const 5))
    )
  ))
  "type mismatch"
)
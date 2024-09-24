;; 3. **Inconsistent Operand Stack Usage between Branches**:    - Create an `if` instruction where the operand stack's height is modified inconsistently between the `then` and `else` blocks, leading to stack misalignment.    - *Constraint*: Stack management rules require the operand stack to be consistent across branches.    - *Relation to CFG*: Tests CFG’s management of operand stacks across conditional branches.

(assert_invalid
  (module (func $inconsistent-operand-stack (result i32)
    (if (result i32)
      (i32.const 1)
      (then (i32.const 1) (i32.add))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)
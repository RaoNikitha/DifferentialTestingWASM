;; 4. **Test Description**:    Use `nop` within an if-else control structure where each branch pushes different values onto the stack. Verify if the operand stack correctly reflects the intended branch's values.    **Constraint Checked**: Ensures `nop` inside conditional branches doesn't disrupt stack consistency.    **Relation to Stack Corruption**: Missteps here might lead to values from one branch interfering with another, corrupting the stack.

(assert_invalid
  (module
    (func $conditional-block (result i32)
      (i32.const 1)
      (if (result i32) (then (nop) (i32.const 10)) (else (nop) (i32.const 20)))
    )
  )
  "type mismatch"
)
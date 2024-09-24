;; 5. **Operand Stack Mismatch:**    - Test a `br` instruction where the operand stack height expected by the label does not match the actual operand stack height at the branch point.    - This evaluates the handling of operand stack unwinding and ensuring consistency with stack polymorphism constraints.

(assert_invalid
  (module
    (func (block (result i32)
      (i32.const 0)
      (i32.const 1)
      (br 0)
    ))
  )
  "type mismatch"
)
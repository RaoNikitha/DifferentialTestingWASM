;; 5. **Unbalanced Operand Stack in `else` Branch**:    - An `if` block where the `else` branch leaves the stack in an unbalanced state compared to the `then` branch, ensuring both branches produce the expected operand stack configuration.    - *Constraint*: Ensuring that both branches leave the operand stack balanced as specified by block type.    - *Relation to CFG*: Verifies the CFG’s handling of stack balance at the block’s exit points.

(assert_invalid
 (module 
  (func (result i32)
   (if (result i32) (i32.const 1)
    (then (i32.const 42))
    (else (i32.const 42) (i32.const 0))
   )
  )
 )
 "type mismatch"
)
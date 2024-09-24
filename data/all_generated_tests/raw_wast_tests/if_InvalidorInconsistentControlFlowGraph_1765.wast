;; 6. **Mismatched Types in Conditional Branches**:    - Use `if` branches with differing types in `then` and `else` blocks, violating the requirement for them to produce the same type of output values.    - *Constraint*: Ensuring both branches produce consistent types as specified by block type.    - *Relation to CFG*: Checks CFG’s handling and type consistency across branches.

(assert_invalid
  (module (func (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 0))
      (else (f32.const 0.0))
    )
  ))
  "type mismatch"
)
;; 7. **Excessive Type Consumption in Branch**:    - Within an `if` block, have one branch consume more operands than the block type specifies.    - Checks whether the implementation ensures the number of operands consumed fits the block type's input specifications.    - **Constraint**: Operand stack management must align with input type constraints defined in the blocktype.

(assert_invalid
  (module
    (func (block
      (if (result i32)
        (i32.const 1)
        (then (drop (i32.const 1) (i32.const 2) (i32.const 3)))
        (else (i32.const 1))
      )
    ))
  )
  "type mismatch"
)
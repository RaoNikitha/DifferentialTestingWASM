;; 2. **Test Block with Extra Operand Consumed**:    - Description: Construct a block that mistakenly consumes an extra operand from the stack at its beginning.    - Constraint: Operand stack behavior within the block.    - Reasoning: This can show differential handling of operand stack initialization within a block, leading to stack underflows if the operands are not correctly managed.

(assert_invalid
  (module (func $test-extra-operand
    (i32.const 1) 
    (block
      (i32.const 2)
      (drop)
      (i32.add)
    )
  ))
  "type mismatch"
)
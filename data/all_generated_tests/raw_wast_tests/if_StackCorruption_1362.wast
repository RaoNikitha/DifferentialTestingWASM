;; 3. **Test 3: Excess Operand Consumption Inside `else` Block**    - **Description**: Implement an `if` instruction with an `else` block that consumes more operands from the stack than it should, leading to a stack underflow within that block.    - **Constraint Checked**: Validation of operands consumed by instructions inside the `else` block against the stack height.    - **Relation to Stack Corruption**: Overconsumption of stack operands can corrupt the stack by leaving it in an inconsistent state.

(assert_invalid
  (module
    (func $excess-operand-consumption
      (i32.const 1) 
      (if (result i32)
        (then (i32.const 2))
        (else (i32.add (i32.const 3) (i32.const 4) (i32.const 5)))
      )
    )
  )
  "type mismatch"
)
;; 6. **Test 6 - Invalid Stack State Before Return**:    - Description: Construct an instruction sequence where the operand stack has a floating-point value while a function expecting an integer return calls the return instruction.    - Constraint: Verifies the proper handling and validation of the operand stack by the `return` instruction.

(assert_invalid
  (module
    (func $invalid-stack-state-before-return (result i32)
      (f32.const 0.0)
      (return)
    )
  )
  "type mismatch"
)
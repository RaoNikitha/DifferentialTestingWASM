;; 1. **Stack Value Mismatch during Return**:    - Test a function that pushes multiple values onto the stack, performs some operations, and then executes a return instruction. The test should verify if the stack unwinds correctly to the expected function result type, validating stack value integrity.    - **Reasoning**: This checks if the return implementation correctly validates stack operations and handles type mismatches due to incorrect operand management or improper stack unwinding.

(assert_invalid
  (module
    (func $stack-value-mismatch-during-return (result i32)
      (i32.const 42)
      (i64.const 9000)
      (i32.add)
      (return)
    )
  )
  "type mismatch"
)
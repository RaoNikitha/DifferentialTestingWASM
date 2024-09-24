;; 5. **Conditional Return with Multiple Operand Types**:    - Create a function where return instructions are placed inside conditional branches, handling different operand types before the return. Validate if the function returns the correct type.    - **Reasoning**: Tests type validation against stack polymorphism, confirming if `popE` correctly handles complex type sequences.

(assert_invalid
  (module
    (func $conditional-return-with-multiple-operands (param i32) (result i32)
      (local i64)
      (if (local.get 0)
        (then
          (local.set 1 (i64.const 10))
          (return (i64.const 5))
        )
        (else
          (return (i32.const 3))
        )
      )
    )
  )
  "type mismatch"
)
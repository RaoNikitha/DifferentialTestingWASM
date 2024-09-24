;; 6. **Test 6: Operand Stack Underflow Handling**    - A situation where `br` instructions excessively consume operands, potentially leading to stack underflow conditions.    - Constraint: Ensure proper management when the stack height is reduced significantly.    - Stack Corruption Check: Check for underflow conditions that might corrupt stack states.

(assert_invalid
  (module
    (func $operand-stack-underflow
      (block (result i32)
        (block (result i32 i32 i32)
          (br 1)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
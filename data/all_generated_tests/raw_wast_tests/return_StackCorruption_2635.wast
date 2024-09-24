;; 4. **Test Mixed Operand Types**:    - Design a function that manipulates operands of mixed types (integers, floats) on the stack before issuing a `return` instruction. Confirm that both implementations correctly handle stack unwinding and operand type consistency, without causing type-related stack corruption.

(assert_invalid
  (module
    (func $mixed-types-stack-handling
      (i32.const 42)
      (f64.const 3.14)
      (return)
    )
  )
  "type mismatch"
)
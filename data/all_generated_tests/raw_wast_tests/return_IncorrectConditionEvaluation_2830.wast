;; 9. **Mixed-Type Operand Stack Conditions**:    - Incorporate mixed-type operations on the stack before a `br_if` based return. Check if type mishandling alters condition evaluation leading to incorrect returns.

(assert_invalid
  (module
    (func $mixed-type-operand-stack (result i32)
      (i32.const 10)
      (f32.const 5.5)
      (br_if 0 (return))
    )
  )
  "type mismatch"
)
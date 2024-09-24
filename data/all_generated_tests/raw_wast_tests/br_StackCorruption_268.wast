;; 9. **Test Name: Direct Branch with Operand Type Mismatch**    - Implement a simple block where `br` targets another block with differing operand types. Ensure the stack correctly reflects consumed/produced types as per the target requirements.

(assert_invalid
  (module
    (func
      (block (result i32)
        (i32.const 1)
        (block (result f32)
          (br 1)
         )
        (i32.const 2))
    )
  )
  "type mismatch"
)
;; 10. **Function with Variable Return Based on Stack State**:    Create a function that checks the stack's state before deciding the return value. Call this function indirectly, manipulating its input stack state externally, and verify the correct stack and return type management.

(assert_invalid
  (module
    (func $type-check-variable-return-stack (param i32) (result i32)
      (local i32)
      (if (i32.eqz (local.get 0))
        (then (return (i32.const 0)))
        (else (local.set 1 (i32.const 1)) (return (local.get 1)))
      )
    )
    (func (result i64) (call $type-check-variable-return-stack (i32.const 1)))
  )
  "type mismatch"
)
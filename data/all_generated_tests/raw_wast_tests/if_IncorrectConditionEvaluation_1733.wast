;; 4. **Mixed Type Conditions and Branching**: Formulate a test that uses mixed operand types for condition evaluation, ensuring the condition is still correctly evaluated as true or false. Verify if the implementation incorrectly handles the type-mixed condition affecting branching.

(assert_invalid
  (module
    (func $mixed-type-condition (result i32)
      (if (result i32)
        (i64.const 1) ;; Should be i32 for condition evaluation
        (then (i32.const 42))
        (else (i32.const 24))
      )
    )
  )
  "type mismatch"
)
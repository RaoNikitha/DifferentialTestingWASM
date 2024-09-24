;; 10. Design an `if` block with invalid nested function calls that attempt to return incorrect types, ensuring the validator correctly identifies and handles these errors before execution.

(assert_invalid
  (module (func $nested-if-invalid-types (result i32)
    (if (result i32) (i32.const 1)
      (then 
        (call 0)
        (if (result f32) (i32.const 1)
          (then (f32.const 1.0))
          (else (i64.const 1))
        )
      )
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)
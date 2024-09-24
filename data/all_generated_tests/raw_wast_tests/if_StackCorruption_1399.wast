;; 10. **Unbalanced `call` Within `if`**:     - **Focus**: Stack corruption via function calls.     - **Description**: Make a function call within an `if` block where the function has improper argument or return management, leading to stack corruption upon return. Verify each implementation’s error handling.

(assert_invalid
  (module
    (func $unbalanced_call_if
      (if (result i32)
        (i32.const 1)
        (then
          (call 1 (i32.const 42))
        )
        (else
          (i32.const 0)
        )
      )
    )
    (func (param i64) (result i64) (local.get 0))
  )
  "type mismatch"
)
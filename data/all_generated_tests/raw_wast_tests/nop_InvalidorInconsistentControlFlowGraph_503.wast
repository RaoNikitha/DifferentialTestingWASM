;; 4. **Test 4: `nop` Placement in Conditional Branches**    - **Constraint Check**: Ensure `nop` inside conditional branches (`if-else`) does not affect branch outcomes.    - **Description**: Use `nop` inside `if` and `else` branches and ensure the correct branch execution based on condition satisfaction doesn’t change.

(assert_invalid
  (module
    (func $conditional-test (param i32) (result i32)
      (if (result i32)
        (local.get 0)
        (then (nop) (i32.const 1))
        (else (nop) (i32.const 2))
      )
    )
  )
  "type mismatch"
)
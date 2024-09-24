;; 9. **Test Scenario**: Generate a function using `if-else` constructs where the `else` branch contains a `return` and an unreachable instruction follows the entire `if-else`.    **Constraint**: Verify correct path selection and stack state post `return`.    **Unreachable Code**: Detect if control erroneously reaches post `if-else` unreachable.

(assert_invalid
  (module
    (func $if_else_return_unreachable (result i32)
      (i32.const 0)
      (if (result i32)
        (then (i32.const 1))
        (else (return))
      )
      unreachable
    )
  )
  "type mismatch"
)
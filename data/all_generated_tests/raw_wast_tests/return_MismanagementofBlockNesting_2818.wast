;; 7. **Nested Block Exception Handling**: Simulate a try-catch-like structure using nested blocks where `try` blocks have their own `return` statements. This test checks if the `return` bypasses intermediate block layers accurately when an exception-like condition is met.

(assert_invalid
  (module
    (func $nested-block-return-handling (result i32)
      (block
        (block
          (return (i32.const 42))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
;; 9. **Unreachable in Try-catch Block After Return**:    - Write a try-catch block where the `try` section includes a `return`, and the `catch` section includes `unreachable`.    - This tests return handling within exception management blocks and ensures the function terminates as expected without hitting `unreachable`.

(assert_invalid
  (module
    (func $type-value-unreachable-try-catch (result i32)
      (try (result i32)
        (do
          (return (i32.const 0))
        )
        (catch
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)
;; 7. **Test Description:**    - Formulate a function with a `try-catch` block nested inside another block structure, where the `catch` contains a `return` statement.    - Test the behavior when `catch` gets executed and check if `return` exits the function scope appropriately.    - **Specific Constraint:** Mismanagement of exception handling contexts and stack unwinding with `return`.

(assert_invalid
  (module
    (func $try-catch-return (result i32)
      (block
        (try (result i32)
          (do
            (throw 0)
          )
          (catch
            (return (i32.const 42))
          )
        )
      )
    )
  )
  "type mismatch"
)
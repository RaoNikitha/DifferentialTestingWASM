;; 6. **Test Description**:    Construct a function with nested blocks, and embed a `return` in a `try-catch` block. Embed `br` instructions within the `try` section to test if `return` properly ignores intermediate error handling flows and targets the function's completion.    - **Specific Constraint**: Ensures `return` escapes error containment and directly returns.    - **Incorrect Branch Target Resolution**: Verifies that `return` disregards intermediate error flows.

(assert_invalid
  (module
    (func (result i32)
      (try (result i32)
        (do
          (local i32)
          (local.set 0 (i32.const 1))
          (br 0)
          (i32.const 2)
        )
        (catch
          (return)
        )
      )
    )
  )
  "type mismatch"
)
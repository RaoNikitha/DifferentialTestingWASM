;; 8. **Return in a Try-Catch Block**:    Place a `return` within a `try` block, ensuring it's correctly managed in the presence of a `catch` block.    - Ensures CFG correctly reflects control flow paths for exceptions and returns.

(assert_invalid
  (module
    (try (result i32)
      (do (return (i32.const 1)))
      (catch (i32.const 2))
    )
  )
  "type mismatch"
)
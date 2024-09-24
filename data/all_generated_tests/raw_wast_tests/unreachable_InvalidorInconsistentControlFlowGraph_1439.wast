;; 10. Use `unreachable` within an exception-handling block (future-proof with `try-catch` constructs), ensuring the `catch` block handles the trap and does not proceed with normal execution.    - **Constraint:** `unreachable` causes immediate trap, properly triggering the exception handling.    - **CFG Check:** Ensure proper CFG handling of traps within exception constructs.

(assert_invalid
  (module
    (func (result i32)
      try (result i32)
        (unreachable)
      catch
        (i32.const 1)
      end
    )
  )
  "type mismatch"
)
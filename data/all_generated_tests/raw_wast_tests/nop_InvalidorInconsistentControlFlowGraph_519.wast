;; 10. Insert `nop` in a function which uses complex control structures like `try-catch` blocks, ensuring exception handling behavior is preserved.     **Constraint:** Confirm `nop` doesn’t interfere with exception handling control flow.

(assert_invalid
  (module
    (func (try (do (nop)) (catch (nop))))
  )
  "invalid type"
)
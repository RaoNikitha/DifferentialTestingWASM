;; 9. **Unexpected Type after Exception Handling**:    - Include an exception handling mechanism (try-catch) within a block, which glitches and yields a wrong type upon capture and return.    - **Constraint:** Verify if exception handling alters context type inappropriately upon `return`.    - **Type Mismatch:** Ensures robust type management across try-catch blocks ending in `return`.

(assert_invalid
  (module
    (func $type-mismatch-after-try-catch (result i32)
      (try (result i32)
        (do
          (return (i32.const 1))
        )
        (catch
          (return)
        )
      )
    )
  )
  "type mismatch"
)
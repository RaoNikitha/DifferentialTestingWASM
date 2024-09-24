;; 2. **Test: `unreachable` within Try-Catch Block**    - **Goal:** Validate how `unreachable` affects the execution flow within a try-catch block.    - **Description:** Embed an `unreachable` instruction within a try block and verify that the catch block properly handles the trap. Ensure that differing implementations result in immediate traps irrespective of the try-catch mechanism.    - **Constraint Checked:** CFG handling of exception mechanisms when `unreachable` is present.

(assert_invalid
  (module
    (func $try-catch-unreachable
      try $label
        unreachable
      catch
        drop
      end
    )
  )
  "unreachable should cause an immediate trap"
)
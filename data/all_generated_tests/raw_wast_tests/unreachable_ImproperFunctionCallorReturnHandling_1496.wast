;; 7. **Unreachable before Function Return:**    - **Test Description:** Design a function that performs its operations, hits an `unreachable` instruction just before normally returning.    - **Constraint Checked:** Validates that `unreachable` prevents the return sequence from proceeding.    - **Improper Handling Aspect:** Ensures that the function does not return any values or exit normally due to the `unreachable` trap.

(assert_invalid
  (module (func $unreachable-before-function-return (result i32)
    (i32.const 42)
    (unreachable)
    (return (i32.const 5))
  ))
  "type mismatch"
)
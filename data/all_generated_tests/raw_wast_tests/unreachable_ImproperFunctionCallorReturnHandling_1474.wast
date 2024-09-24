;; 5. **Test 5: Unreachable in Function Type Mismatch**    - Description: Use the `unreachable` instruction in a function containing a type mismatch error immediately following a function call.      - *Constraint:* Ensures that type mismatch checking respects `unreachable`.      - *Improper Handling Check:* Assures that a `call` does not proceed despite the type mismatch that `unreachable` causes.

(assert_invalid
  (module (func $unreachable-after-invalid-call
    (call $undefined_function) (unreachable)
  ))
  "type mismatch"
)
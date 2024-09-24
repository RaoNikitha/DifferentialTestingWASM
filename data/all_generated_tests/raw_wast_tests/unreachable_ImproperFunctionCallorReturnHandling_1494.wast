;; 5. **Nested Calls with Intervening Unreachable:**    - **Test Description:** Create a nested function call sequence where the intermediate function contains an `unreachable` instruction.    - **Constraint Checked:** Checks the handling of nested function calls being interrupted by the `unreachable` trap in intermediate functions.    - **Improper Handling Aspect:** Ensures that the correct return sequence does not proceed beyond the `unreachable` execution in nested scenarios.

(assert_invalid
  (module
    (func $inner (unreachable) (nop))
    (func $outer (call $inner) (i32.const 42))
  )
  "type mismatch"
)
;; 7. **Unreachable in Function Prologue:**    - **Description:** Place an `unreachable` instruction at the beginning of a function body to ensure it traps immediately when the function is called.    - **Constraint:** Tests function entry point behavior.    - **Relation to Unreachable Code Execution:** Ensures no code runs in the function if `unreachable` is at the start.

(assert_invalid
  (module (func $unreachable-in-function-prologue
    (unreachable) (i32.const 42)
  ))
  "type mismatch"
)
;; 1. **Immediate Unreachable after Call:**    - **Test Description:** Define a function that performs valid operations and then calls another function that immediately contains an `unreachable` instruction.    - **Constraint Checked:** The proper handling of the trap from the `unreachable` instruction after a function call.    - **Improper Handling Aspect:** Ensures that the `unreachable` instruction within a called function leads to a trap interrupting further execution and does not continue to the return.

(assert_invalid
  (module
    (func $callee (unreachable))
    (func $caller (call $callee) (i32.const 1))
  )
  "unreachable executed"
)
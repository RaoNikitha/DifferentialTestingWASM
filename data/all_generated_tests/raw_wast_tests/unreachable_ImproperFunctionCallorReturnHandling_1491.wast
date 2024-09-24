;; 2. **Unreachable in Conditional Branch with Call:**    - **Test Description:** Create a function containing a conditional branch where one branch calls another function and the other branch contains an `unreachable` instruction.    - **Constraint Checked:** Validates whether the call via one branch and the immediate trap via the `unreachable` instruction in the other branch are correctly handled.    - **Improper Handling Aspect:** Checks that conditional branching combined with function calls doesn't bypass the trap caused by `unreachable`.

(assert_invalid
  (module (func $type-conditional-unreachable-with-call
    (i32.const 0) 
    (if (then (call $dummy) (unreachable)))
  ))
  "type mismatch"
)
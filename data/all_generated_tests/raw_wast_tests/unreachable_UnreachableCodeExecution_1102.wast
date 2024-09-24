;; 3. **Test Description:**    - **Scenario:** Use the `unreachable` instruction inside a loop with a condition that typically exits gracefully.    - **Constraint Checked:** Checks the interpreter’s response when loop conditions malfunction, leading to `unreachable`.    - **Relation to Unreachable Code Execution:** Verifies that looping errors resulting in executing `unreachable` cause a trap immediately.

(assert_invalid
  (module (func (result i32)
    (loop (br_if 0 (i32.const 1)) (unreachable))
    (i32.const 0)
  ))
  "type mismatch"
)
;; 3. **Loop with Conditional Branch Reaching Unreachable**:    - Create a loop containing a conditional branch (`br_if`) that, if the condition fails, proceeds to an `unreachable` instruction.    - **Constraint**: Checks proper evaluation and execution of conditional branches.    - **Relation to Unreachable Code Execution**: Verifies that a failing condition correctly leads to `unreachable`.

(assert_invalid
  (module (func
    (loop (br_if 0 (i32.const 0)) unreachable)
  ))
  "unreachable executed"
)
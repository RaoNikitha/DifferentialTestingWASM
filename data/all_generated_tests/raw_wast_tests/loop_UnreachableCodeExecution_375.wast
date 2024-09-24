;; 6. **Forward Branch in Loop Skipping Unreachable**:    - Construct a loop with a forward branch (`br 1`) intended to skip over an `unreachable` instruction.    - **Constraint**: Tests correct forward branching and label handling within loops.    - **Relation to Unreachable Code Execution**: Ensures forward branches properly bypass `unreachable` without executing.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (br 1)
        unreachable
      )
    )
  )
  "type mismatch"
)
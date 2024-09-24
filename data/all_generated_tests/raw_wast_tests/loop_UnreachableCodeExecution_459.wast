;; 10. **Nested Loops with Cross-branching Leading to Unreachable**:     - Create nested loops with cross-branching where a branch within one loop can erroneously target an `unreachable` instruction in another.     - **Constraint**: Verifies the handling of cross-branching between nested loops, ensuring proper execution flow.     - **Unreachable Code Execution**: Ensures cross-loop branch faults do not result in reaching `unreachable`.

(assert_invalid
  (module (func $nested-loops-cross-branching
    (loop $outer (result i32)
      (i32.const 1)
      (loop $inner (result i32)
        (br $outer)
        (unreachable)
      )
    )
  ))
  "type mismatch"
)
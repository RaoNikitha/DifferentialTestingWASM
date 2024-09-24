;; 10. **Indirect Branch to Unreachable in Loop**:    - Test a loop with an indirect branch (`br_table`) whose out-of-bounds target unexpectedly leads to an `unreachable` instruction.    - **Constraint**: Verifies correctness of branch table handling and index checks.    - **Relation to Unreachable Code Execution**: Ensures misdirected branches to `unreachable` are identified correctly.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (block (result i32)
          (i32.const 0)
          (i32.const 1)
          (br_table 1 0 0)
        )
        (unreachable)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
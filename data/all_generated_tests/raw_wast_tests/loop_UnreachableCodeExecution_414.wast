;; 5. **Test Description**: A loop block that includes a `br_table` with multiple entries targeting various labels within the loop. The default branch leads to an `unreachable` instruction:    - **Constraint Checked**: Correctly resolving indices in `br_table`; handling default branch correctly.    - **Unreachable Code Execution**: An out-of-bounds `br_table` index might erroneously default to reaching `unreachable`.

(assert_invalid
  (module (func $br-table-loop-unreachable
    (loop (result i32)
      (i32.const 0)
      (br_table 0 0 0 1 (i32.const 1))
      (unreachable)
    )
  ))
  "type mismatch"
)
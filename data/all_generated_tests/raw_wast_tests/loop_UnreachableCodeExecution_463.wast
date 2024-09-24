;; 4. **Loop with Branch Table to Unreachable**:    - **Description**: Implement a loop containing a `br_table` that can index to a case containing an unreachable instruction.    - **Constraint Checked**: Verifies correct indexing and target calculation in branch tables.    - **Unreachable Execution Check**: Checks if the `br_table` correctly traps when targeting an unreachable instruction.

(assert_invalid
  (module (func $loop-with-br-table-to-unreachable
    (loop (block (br_table 0 1 (br 2))) (unreachable))
  ))
  "unreachable executed"
)
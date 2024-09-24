;; 8. **Stack Overlap Scenarios**:    - Create a `br_table` in a scenario where it could cause stack overlap or corruption if not handled properly.    - **Constraint**: Examine the integrity of stack management during `br_table` execution.    - **Edge Case**: Ensures stack operations are correctly maintained.

(assert_invalid
  (module
    (func $stack-overlap-via-br_table
      (i32.const 0)
      (block
        (i32.const 1)
        (br_table 0 (return))
      )
    )
  )
  "type mismatch"
)
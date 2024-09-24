;; 8. **Test Case 8**: Nested loops containing `br_table` instructions that branch to each other's beginning.    - **Constraint**: Ensuring that cross-loop branching is correctly managed.    - **Relation to br_table Edge Case**: Checks handling of complex backward cross-branching scenarios.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 0)
        (br_table 0 1)
        (nop)
      end)
      (loop (result i32)
        (i32.const 1)
        (br_table 1 0)
        (nop)
      end)
    )
  )
  "type mismatch"
)
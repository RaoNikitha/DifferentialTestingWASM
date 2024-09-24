;; 10. **Test Description**:    - Create a `loop` featuring a `br_table` with mixed valid and invalid target references, testing rapid transitions between correct and error states.    - **Constraint**: Ensures proper alternating handling of valid and invalid entries.    - **Edge Case**: Evaluates consistency in switching context between valid and invalid branches.

(assert_invalid
  (module
    (func $test
      (block $outer
        (loop $l1
          (i32.const 0)
          (br_table $outer $l1 $invalid_block)
        )
      )
    )
  )
  "branch target out of range"
)
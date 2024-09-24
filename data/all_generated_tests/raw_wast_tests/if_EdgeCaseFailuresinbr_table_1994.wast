;; 5. **Test Description**: Confirm `if` true path with a valid `br_table` targeting the maximum valid index properly exits without error.    - **Constraint**: Ensures the right control flow where `br_table` with highest valid index completes as designed.    - **Relation to Edge Case**: Validates that control flow follows the correct and expected output path when targeted properly.

(assert_invalid
  (module
    (func $br-table-max-target-valid
      (if (i32.const 1)
        (then
          (block
            (br_table 0 0 (i32.const 0))
          )
        )
        (else
          (nop)
        )
      )
    )
  )
  "type mismatch"
)
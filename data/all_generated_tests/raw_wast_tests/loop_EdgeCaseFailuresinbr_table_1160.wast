;; 1. **Test Description**:     Create a loop with a `br_table` whose index operand is sufficiently high, exceeding the number of target labels.     - **Constraint**: Checks if `br_table` correctly defaults to the proper target when the index is out of bounds.     - **Edge Case**: Verifies handling of excess index values beyond available targets.

(assert_invalid
  (module (func $test-br_table-index (result i32)
    (loop (result i32)
      (block $default
        (block $label0
          (block $label1
            (i32.const 3)
            (br_table $label0 $label1 $default)
          )
        )
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)
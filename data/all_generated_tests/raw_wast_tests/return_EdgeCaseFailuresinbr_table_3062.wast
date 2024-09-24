;; 1. **Test Description**: A function that uses `br_table` with indices properly within the bounds of available targets, followed by a `return` instruction within each target block, ensuring proper return type handling.    - **Constraint**: Validates that the `return` instruction correctly manages stack unwinding and type handling when branching within bounds.

(assert_invalid
  (module
    (func $test_br_table_return (result i32)
      (i32.const 0)
      (block $label1 (result i32)
        (block $label2 (result i32)
          (br_table $label1 $label2 (i32.const 0))
          (return)
        )
      )
    )
  )
  "type mismatch"
)
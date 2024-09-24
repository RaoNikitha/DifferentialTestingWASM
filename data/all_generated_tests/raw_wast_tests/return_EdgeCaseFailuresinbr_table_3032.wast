;; 1. **Test: Out-of-Bounds `br_table` Index Leading to Return**    - **Description**: The function contains a `br_table` with an index larger than the number of available targets, followed immediately by a `return` instruction. This ensures that the index is out-of-bounds and checks if the return properly exits the function without side effects.    - **Constraint**: Verifying if a bounded `br_table` correctly unwinds the stack and respects the `return` instruction.

(assert_invalid
  (module
    (func $out_of_bounds_br_table_leading_to_return (result i32)
      (i32.const 0)
      (block (result i32)
        (br_table 1 (i32.const 1))
        (return)
      )
    )
  )
  "type mismatch"
)
;; 2. **Test Description**: A function with a `br_table` where the index is exactly at the boundary of the provided targets. Checks if the `return` instruction in the terminal block correctly unwinds the stack.    - **Constraint**: Tests edge handling at boundary indices, ensuring no out-of-bounds errors.

(assert_invalid
  (module
    (func $type-value-boundary-in-br_table (result i32)
      (i32.const 1)
      (block (br_table 0 1 (return)))
    )
  )
  "type mismatch"
)
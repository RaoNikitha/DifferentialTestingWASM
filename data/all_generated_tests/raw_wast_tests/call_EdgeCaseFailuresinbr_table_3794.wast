;; 3. **Test: Br_Table with Maximum Bound Index**    - **Description**: Apply a `br_table` instruction using the maximum valid index, followed by a `call` that returns multiple values.    - **Constraint**: Verify the correct execution and return value placement from the `call` on the stack.    - **Edge Case**: Ensures proper handling of max bound indices and correctly ordered stack operation during nested `call`.

(assert_invalid
  (module
    (type (func (result i32 i64)))
    (type (func))
    (table funcref)
    (func $multi-return (result i32 i64)
      i32.const 42
      i64.const 84
    )
    (func $test
      (block
        (call $multi-return)
        (br_table 0 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)
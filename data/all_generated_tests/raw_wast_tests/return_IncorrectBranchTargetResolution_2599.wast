;; 8. **Test Description**:    Implement a function with complex nested blocks that use `br_table` for switching between blocks. Place a `return` statement after the `br_table` usage and verify correct targeting of the outermost function block.    - **Specific Constraint**: Ensures `return` resolves past `br_table` complexity.    - **Incorrect Branch Target Resolution**: Tests label resolution amidst `br_table` jumps.

(assert_invalid
  (module
    (func $test_nested_br_table_return (result i32)
      (block 
        (loop 
          (br_table 0 0 (return))
        )
      )
      (return (i32.const 0))
    )
  )
  "type mismatch"
)
;; 4. **Test Description**: Embed a `br_table` with mixed valid and invalid target indices within a nested structure of functions. Verify how the engines manage index errors within nested function calls.    - **Specific Constraint**: Nested function calls must handle both valid and invalid indices gracefully.    - **Relation to `call`**: Verify if nested indexing errors in `br_table` correlate with nested function call index handling.

(assert_invalid
  (module
    (func $test-invalid-br-table
      (block
        (call 1)
        (br_table (i32.const 0) (i32.const 1) (br 0))
      )
    )
    (func (param i32) (result i32) (i32.const 1))
    (func (param i64) (result i64) (i64.const 2))
  )
  "type mismatch in br_table index"
)
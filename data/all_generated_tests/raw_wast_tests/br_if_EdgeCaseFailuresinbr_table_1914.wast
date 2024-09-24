;; 5. **Test 5: `br_if` with operand stack containing multiple data types**    - **Constraint**: The operand stack must handle various data types correctly prior to and after branching.    - **Check**: Ensures correct stack transformation while `br_if` skips or branches.    - **Relation to Edge Cases**: Ensures that `br_table` resolves operand stack states correctly when data types vary.

(assert_invalid
  (module
    (func $multiple-data-types (result i32)
      (block (result i32) 
        (i32.const 42)
        (f64.const 3.14)
        (br_if 0 (i32.const 0))
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
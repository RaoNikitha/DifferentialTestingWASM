;; 5. **Test Description**:    - Create a loop with a `br_table` where the default index points to a nested instruction.    - Ensure proper execution flow to the nested instruction.    - This tests nested block handling within loop `br_table` defaults.    -

(assert_invalid
  (module
    (func $br_table_with_nested_instruction (result i32)
      (loop (result i32)
        (block
          (br_table 0 0 1 i32.const 2)
          (return (i32.const 1))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
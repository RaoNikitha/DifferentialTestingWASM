;; 5. **Test Case: Mixed Instruction and Branching in Deep Nesting**    - **Test Description**: Build a deeply nested block structure with intermixed arithmetic operations, memory loads/stores, and branching instructions (`br_table`). Confirm after execution that control flow correctly navigates through and exits all nested blocks without error.    - **Constraint**: Ensures operations within and across blocks correctly reflect nested structures and label management.    - **Relation to Mismanagement**: A failure in understanding nesting depth would cause memory access violations or incorrect operand stack results.

(assert_invalid
  (module
    (func $deep-nesting
      (block (result i32)
        (i32.const 0)
        (block (result i32)
          (i32.const 1)
          (block (result i32)
            (i32.const 2)
            (block (result i32)
              (i32.const 3)
              (br_table 0 1 2 3)
              (br_if 0 (i32.const 0))
              (i32.const 4)
              (end)
            )
            (i32.const 5)
            (end)
          )
          (i32.const 6)
          (end)
        )
        (i32.const 7)
        (end)
      )
    )
  )
  "type mismatch"
)
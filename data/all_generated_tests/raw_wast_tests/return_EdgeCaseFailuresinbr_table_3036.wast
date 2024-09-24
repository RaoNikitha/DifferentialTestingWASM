;; 5. **Test: Mixed Type Stacks with `br_table` and Return**    - **Description**: Introduce mixed type operations in the operand stack with interleaved `br_table` and `return` instructions, aiming to see if operand types are managed properly when unwinding the stack.    - **Constraint**: Ensuring `br_table` does not corrupt the stack state before a return.

(assert_invalid
  (module
    (func $mixed-type-stack-br_table-return (result i32)
      (i32.const 1)
      (i32.const 2)
      (i32.const 3)
      (block (br_table 0 0 (return)))
    )
  )
  "type mismatch"
)
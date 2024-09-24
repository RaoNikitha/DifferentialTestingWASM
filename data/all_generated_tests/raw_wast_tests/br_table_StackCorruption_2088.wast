;; 8. **Test8: Conditional Operand Removal**    - **Description:** Implement conditional logic where `br_table` indirectly removes operands from the stack, observing the consequences for subsequent instructions.    - **Stack Corruption Check:** Examine stack state post-condition, focusing on operand corruption or unexpected removals.

(assert_invalid
  (module
    (func $conditional_stack_removal
      (block
        (i32.const 0)
        (i32.const 1)
        (if (i32.eq (i32.const 10) (i32.const 10))
          (then
            (br_table 0 1 (i32.const 2))
          )
        )
        (i32.const 3) ;; This should be invalid since br_table should not affect subsequent instructions
      )
    )
  )
  "type mismatch"
)
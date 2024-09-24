;; 4. **Test 4: Operand Misalignment Due to Early Exit**    - **Description**: Use a branching instruction inside the `then` block to exit early without restoring the stack height, and later attempt to use the stack in the `else` block.    - **Constraint Checked**: Proper handling of early exits and the consequent stack height corrections.    - **Relation to Stack Corruption**: Erroneous early exits can lead to improper stack states, causing corruption when the `else` block begins execution.

(assert_invalid
  (module
    (func $test_operand_misalignment_due_to_early_exit (result i32)
      (if (result i32) (i32.const 1)
        (then
          (br 0)
          (i32.const 2)
        )
        (else
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)
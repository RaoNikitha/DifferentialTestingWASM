;; 5. **Test: Incorrect Operand Stack Evaluation with `br` in `else`**    - **Description**: Use a `br` (branch) instruction in the `else` block that does not match the operand stack requirements of its target.    - **Constraint Checked**: Stack type consistency when branching out of an `else` block.    - **CFG Relevance**: Tests how the CFG handles operand stack states during branch operations out of `else` blocks.

(assert_invalid
  (module
    (func $test_incorrect_br_in_else
      (block $outer
        (if (i32.const 0)
          (then)
          (else
            (br $outer (i32.const 1)) ; Incorrect operand stack evaluation
          )
        )
      )
    )
  )
  "type mismatch"
)
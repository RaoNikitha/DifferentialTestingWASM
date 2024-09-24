;; 9. **Invalid Stack Cleanup on Branch:**    - Description: Use a `br_table` with indices leading to labels that would require the operand stack to be cleaned up incorrectly in Wizard Engine but correctly in WebAssembly.    - Check whether the operand stack is handled properly after branching, and it is consistent with expected behavior.    - Specific Constraint: Confirm the proper stack unwinding and cleanup procedures.

(assert_invalid
  (module (func $invalid-stack-cleanup
    (block (result i32)
      (block
        (br_table 0 (i32.const 1)) (i32.const 1)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)
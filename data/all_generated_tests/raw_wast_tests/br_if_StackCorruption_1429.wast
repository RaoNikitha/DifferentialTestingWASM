;; 10. **Test Description**:      Test a nested `if-else` structure with `br_if` instructions within each branch, targeting multiple depths. Verify stack state consistency across different branches and conditions.     - **Constraint Checked**: Correct execution flow and stack unwinding in complex `if-else` conditions.     - **Stack Corruption Check**: Prevents stack corruption from improper conditional branch targets.

(assert_invalid
  (module
    (func $nested_if_else_br_if
      (block
        (i32.const 1) (if (result i32)
          (then (br_if 0 (i32.const 0)))
          (else (block (br_if 1 (i32.const 1)) (i32.const 0)))
        )
        (i32.const 0) (br_if 1)
      )
      (i32.const 0) (drop)
    )
  )
  "type mismatch"
)
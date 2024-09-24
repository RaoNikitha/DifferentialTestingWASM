;; 6. **Test 6 - Default Branch Operand Mismatch**:    Use a `br_table` instruction where the operand for the default branch does not match the operand stack configuration required by the default target. This verifies proper CFG branching behavior and error handling.

(assert_invalid
  (module (func $default-branch-operand-mismatch
    (block (result i32)
      (br_table 0 1 (i64.const 1) (i32.const 2))
      (i32.const 1)
    )
  ))
  "type mismatch"
)
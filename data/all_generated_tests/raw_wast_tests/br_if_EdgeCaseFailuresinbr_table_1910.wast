;; 1. **Test 1: `br_if` with a single target label and zero stack operand**    - **Constraint**: Ensures that the `br_if` correctly branches to the innermost label when the stack operand is zero.    - **Check**: Verifies that the stack remains unchanged if the condition is false.    - **Relation to Edge Cases**: Tests if `br_table` properly handles edge cases by ensuring a direct `br_if` does not alter the stack when it should not jump.

(assert_invalid
  (module (func $br_if-zero-stack
    (block (br_if 0 (i32.const 0)))
  ))
  "type mismatch"
)
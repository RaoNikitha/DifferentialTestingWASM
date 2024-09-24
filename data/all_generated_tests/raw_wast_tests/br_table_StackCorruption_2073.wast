;; 3. **Test: Mismatched Operand Stack Types**    - **Description:** Create a `br_table` where the label targets expect different stack types than those provided.    - **Constraint:** Ensure operand types match expected types of target blocks.    - **Relation to Stack Corruption:** Validates type checking and stack state management when incorrectly typed operands are used.

(assert_invalid
  (module (func $mismatched-operand-stack-types
    (block (result i32)
      (br_table 0 0 0 (i32.const 1) (i64.const 1)) (i32.const 1)
    )
  ))
  "type mismatch"
)
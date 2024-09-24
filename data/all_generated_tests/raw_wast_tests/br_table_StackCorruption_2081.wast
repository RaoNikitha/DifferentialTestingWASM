;; 1. **Test1: Skewed Operand Stack Length Matching**    - **Description:** Design a `br_table` with multiple labels, where one of the branch targets has more operands than the others. This mismatch in the operand stack length should lead to an error.    - **Stack Corruption Check:** Verify if the stack integrity is compromised when the `br_table` mismatches operand counts.

(assert_invalid
  (module (func $skewed-stack-length-matching
    (block (result i32)
      (block (block (result i32)
        (br_table 0 1 (i32.const 1) (i64.const 1))
      ) (i32.const 1))
    )
  ))
  "type mismatch"
)
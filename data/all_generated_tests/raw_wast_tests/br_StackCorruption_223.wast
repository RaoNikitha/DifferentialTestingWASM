;; 4. **Test Br Within an If-Else Block:**    - **Description:** Use `br` within an `if-else` block, targeting a label outside the if construct.    - **Reasoning:** Checking if the branch correctly unwinds operands and continues after the else block’s `end`.    - **Constraint:** Proper label indexing within the conditional structure.    - **Relation to Stack Corruption:** If the operand stack is unwound incorrectly, it could cause corrupted stack states continuing after the else block.

(assert_invalid
  (module
    (func (if (i32.const 1) (then (block (br 1))) (else (block (br 1)))))
  )
  "unknown label"
)
;; 4. **Test4: Default Label Operand Length Overrun**    - **Description:** Create a `br_table` where the default label expects fewer operands on the stack than the specified branches.    - **Stack Corruption Check:** Assess if the default branch causes stack underflow or if operands are dropped improperly.

(assert_invalid
  (module
    (func
      (block (br_table 0 (i32.const 0) (nop)))
      (i32.const 1) (drop)
    )
  )
  "type mismatch"
)
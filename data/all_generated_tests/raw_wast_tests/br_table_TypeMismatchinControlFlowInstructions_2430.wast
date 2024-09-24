;; 10. Test Description 10: Create a control flow with nested `br_table` instructions that incorrectly assume operand types are consistent across branches, leading to a type mismatch error when executing specific branches.

(assert_invalid
  (module (func (block (br_table 0 1 0 (i32.const 1) (i64.const 0))))
  )
  "type mismatch"
)
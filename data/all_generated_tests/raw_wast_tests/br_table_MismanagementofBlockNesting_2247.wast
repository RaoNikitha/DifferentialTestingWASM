;; 7. **Unmatched Operand Types in Nested Blocks:**    - Use a nested block where `br_table` targets refer to blocks with differing operand types.    - Checks whether the implementation correctly handles mismatched operand types and yields proper errors or traps.

(assert_invalid
  (module (func $unmatched-operand-types-nested
    (block (block (i32.const 1) (br_table 0 1 (i64.const 0))))
  ))
  "type mismatch"
)
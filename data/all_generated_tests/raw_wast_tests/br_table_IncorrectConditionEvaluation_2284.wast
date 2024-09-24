;; 4. **Test Description:** Construct a `br_table` with backward branches intended to match the input of the targeted block type. Use operands mismatched in type or count to the targeted block. This test examines discrepancies when the condition incorrectly validates operand types in `wizard_engine`.

(assert_invalid
  (module (func $backward-branch-mismatch
    (loop (result i32) (i32.const 2) (br_table 0 0 (i32.const 0)) (i32.const 1))
    (i32.const 3)
  ))
  "type mismatch"
)
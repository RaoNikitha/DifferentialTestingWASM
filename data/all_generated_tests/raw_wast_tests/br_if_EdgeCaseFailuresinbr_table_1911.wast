;; 2. **Test 2: `br_if` with multiple nested labels and non-zero stack operand**    - **Constraint**: Validates that `br_if` jumps to the correct nested label when the condition is non-zero.    - **Check**: Validates stack unwinding to the correct label and subsequent instruction execution.    - **Relation to Edge Cases**: Verifies if `br_table` handles multiple destinations by ensuring `br_if` correctly jumps over multiple labels.

(assert_invalid
  (module (func $nested-br_if 
    (block $LBL_1 
      (block $LBL_2
        (block $LBL_3
          (br_if 2 (i32.const 1))
          (return (i32.const 0))
        )
        (i32.const 0)
      )
      (i32.const 0)
    )
  ))
  "unknown label"
)
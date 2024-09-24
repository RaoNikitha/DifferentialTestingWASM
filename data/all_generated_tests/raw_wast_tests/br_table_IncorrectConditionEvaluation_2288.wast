;; 8. **Test Description:** Design a `br_table` with a condition intended to always result in the default label branch. The operand should trigger `br_table` through unique label conditions misunderstood by `wizard_engine`. The test checks for the accurate interpretation of default conditions.

(assert_invalid
  (module (func $wrong-default-type
    (block (br_table 0 0 1 (i32.const 0) (i32.const 5)) (i64.const 0))
  ))
  "type mismatch"
)
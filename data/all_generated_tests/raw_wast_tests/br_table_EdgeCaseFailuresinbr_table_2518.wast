;; 7. Test Description: **Non-Matching Operand Types in Target Labels**    - **Constraint Checked:** Operand type matching with target labels.    - **How it Relates:** Ensures that type mismatches between the indices and the default label lead to expected behavior or traps.

(assert_invalid
  (module
    (func $non_matching_operand_types
      (block (result i32)
        (br_table 0 1 (i32.const 1)) (i64.const 1)
      )
    )
  )
  "type mismatch"
)
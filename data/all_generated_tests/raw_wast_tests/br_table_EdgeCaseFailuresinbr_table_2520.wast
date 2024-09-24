;; 9. Test Description: **Unequal Operand Stack Depths between Target Labels**    - **Constraint Checked:** Stack depth consistency against target labels.    - **How it Relates:** Validates that improper stack depth management leads to correct branching or expected traps.

(assert_invalid
  (module
    (func
      (block
        (block
          (br_table 0 0 (i32.const 1) (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)
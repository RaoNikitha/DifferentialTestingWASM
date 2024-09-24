;; 6. **Cross-Module Branch to Deeply Nested Block:**    - Design a complex module where `br_table` attempts to branch to a deeply nested block that requires an imported function call.    - **Constraint Checked:** The handling of deeply nested structures and operand stack when control flow crosses module boundaries.    - **Reasoning:** Examines if control flow and stack state are accurately preserved through deep nesting and module boundary transitions.

(assert_invalid
  (module
    (func $imported (import "env" "imported_func") (param i32) (result i32))
    (func $deeply_nested
      (block
        (block
          (block
            (block
              (block
                (br_table 0 0 0 0 (i32.const 5))
                (call $imported (i32.const 10))
              )
            )
          )
        )
      )
    )
  )
  "invalid module"
)
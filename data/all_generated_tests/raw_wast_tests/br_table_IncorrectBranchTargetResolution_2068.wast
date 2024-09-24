;; 8. **Test Description:** Test a `br_table` that involves deeply nested if-else blocks, verifying that the branching happens correctly based on the operand and falls to the default label when the operand is out of bounds.    - **Constraint Checked:** Ensures correct branching within nested if-else blocks.    - **Relation to Incorrect Branch Target Resolution:** Misresolved branches could lead to skipping or incorrect block execution.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result i32)
        (if (i32.const 1)
          (block (result i32)
            (block (result i32)
              (br_table 0 1 2 (i32.const 3))
            )
          )
          (block (result i32)
            (br_table 0 1 2 (i32.const 0))
          )
        )
      )
    )
  ))
  "unknown label"
)
;; 5. **Loop with br_table and Default Target**:    - Create a loop that utilizes `br_table` with a reachable and a default target. Verify how context handles out-of-bound indices.    - **Constraint**: Ensure correct values for table indices and default targets.    - **CFG Check**: The CFG should reflect possible jumps to the default target properly.

(assert_invalid
  (module
    (func $br_table_with_loop (param i32)
      (local i32)
      (loop (block
        (block
          (br_table 1 0 (local.get 0))
        )
        (return)
      ))
    )
  )
  "type mismatch"
)
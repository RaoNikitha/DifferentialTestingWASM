;; 8. **Test Description 8:** Nested `if-else` structures where the `br_if` condition checks for a specific variable being non-zero in only one path. Incorrect differentiation between branches.    - **Constraint Checked:** Conditional branching based on nested conditional checks.    - **Differential Behavior:** Wizard Engine may confuse the correct path based on condition failing to branch correctly.

(assert_invalid
  (module
    (func $nested-if-else
      (local i32)
      (block
        (block
          (if (i32.const 1)
            (then
              (block
                (block
                  (br 2)
                )
              )
            )
            (else
              (block
                (br 1)
              )
            )
          )
        )
        (drop)
      )
    )
  )
  "unknown label"
)
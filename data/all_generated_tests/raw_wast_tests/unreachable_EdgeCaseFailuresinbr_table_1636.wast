;; 7. **Test Description:**    - **Edge Case:** Floating-point values in br_table with `unreachable`.    - **Constraint Checked:** Confirm how non-integer types like floating-points within `br_table` affect `unreachable`.    - **Details:** Add `br_table` labels expecting integers but supply floating-point indices; verify that it consistently traps via `unreachable`.

(assert_invalid
  (module
    (func $type-br_table-float
      (block
        (block
          (br_table 0 1 (f32.const 0.0))
        )
      )
      (unreachable)
    )
  )
  "type mismatch"
)
;; 2. **Test Description:**    - **Edge Case:** Minimum and maximum index handling in `br_table`.    - **Constraint Checked:** Proper trapping with `unreachable` when the index is exactly at 0 or max boundary.    - **Details:** A `br_table` with several targets including minimum and maximum indices, ensuring `unreachable` is hit within these boundary cases.

(assert_invalid
  (module
    (func
      (block
        (br_table 0 0 0 0 (unreachable))
      )
    )
  )
  "type mismatch"
)
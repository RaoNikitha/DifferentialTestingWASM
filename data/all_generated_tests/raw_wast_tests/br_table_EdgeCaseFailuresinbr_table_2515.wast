;; 4. Test Description: **Negative Index Operand**    - **Constraint Checked:** Handling of negative operand indices.    - **How it Relates:** Ensuring negative indices do not cause unexpected behavior and default label is used.

(assert_invalid
  (module
    (func
      (block (br_table 0 1 2 (i32.const -1)))
    )
  )
  "unknown label"
)
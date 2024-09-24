;; 2. Test Description: **Empty Label Vector**    - **Constraint Checked:** An empty vector of labels with a default label.    - **How it Relates:** Testing `br_table` with no labels, ensuring the default branch is taken irrespective of the operand value.

(assert_invalid
  (module (func $empty-label-vector
    (block
      (br_table 0 (i32.const 0))
    )
  ))
  "unknown label"
)
;; 1. Test Description: **Out of Bounds Index with Multiple Labels**    - **Constraint Checked:** Operand out of bounds; ensuring the default label is used.    - **How it Relates:** This test uses an index that exceeds the number of available target labels to see if the default label correctly handles the out of bounds scenario.

(assert_invalid
  (module
    (func $test-out-of-bounds
      (block (block (block (br_table 0 1 2 3 (i32.const 5)))))
    )
  )
  "unknown label"
)
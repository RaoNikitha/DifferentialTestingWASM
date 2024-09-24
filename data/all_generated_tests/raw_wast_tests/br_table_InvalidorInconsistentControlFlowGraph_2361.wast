;; 1. **Test for Out-of-Bounds Operand with Nested Block:**    - **Description:** Construct a deeply nested block structure where the `br_table` instruction references an operand that indexes beyond the provided label vector. Ensure that this operand is at the bottom of the stack, and verify if the implementation correctly defaults to the specified label.    - **Constraint Checked:** Correct handling of out-of-bounds operand indexing; CFG should account for the default branch.

(assert_invalid
  (module (func $out_of_bounds_br_table
    (block (loop (block (block (block
      (i32.const 5)
      (br_table 0 1 2 (br 3)) (br 4) (br 5)
    )))))
  ))
  "unknown label"
)
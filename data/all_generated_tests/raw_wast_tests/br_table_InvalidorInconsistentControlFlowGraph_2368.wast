;; 8. **Test for Accessing Invalid Label Indices:**    - **Description:** Construct `br_table` within a block that accesses labels beyond the defined bounds or non-existent labels, leading to potentially undefined CFG states.    - **Constraint Checked:** Ensuring CFG properly implements boundary checking on valid label indices and prevents accessing out-of-bound labels.

(assert_invalid
  (module (func (block (br_table 0 1 2 (i32.const 3)))))
  "unknown label"
)
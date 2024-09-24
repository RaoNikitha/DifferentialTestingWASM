;; 6. **Test Description:**    - **Edge Case:** Empty target list in `br_table`.    - **Constraint Checked:** Behavior when `br_table` has an empty list of branched targets followed by `unreachable`.    - **Details:** Ensure an immediate trap when `br_table` with no branches followed by `unreachable` tries to execute.

(assert_invalid
  (module (func (block (br_table 0 []) (unreachable))))
  "type mismatch"
)
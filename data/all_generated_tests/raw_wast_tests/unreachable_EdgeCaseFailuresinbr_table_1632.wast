;; 3. **Test Description:**    - **Edge Case:** Negative index value handling.    - **Constraint Checked:** How `unreachable` deals with prefixed negative index values in `br_table`.    - **Details:** Although indices should be non-negative, structure a test where an erroneous negative index could be introduced to verify `unreachable` traps correctly.

(assert_invalid
  (module (func $type-br_table-negative-index
    (block (br_table -1 (unreachable) (f32.const 1)))
  ))
  "type mismatch"
)
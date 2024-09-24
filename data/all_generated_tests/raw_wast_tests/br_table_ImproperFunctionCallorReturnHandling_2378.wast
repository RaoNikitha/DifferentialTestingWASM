;; 8. **Test Description: Incorrectly Indexed Function Table:**    - Construct a scenario where a `br_table` leads to an indirect call via incorrectly indexed function table entries.    - **Constraint Checked:** Assesses handling of invalid function indices within a function table.    - **Relation to Function Call:** Verifies control flow targeting indirect calls by ensuring invalid indices default correctly.

(assert_invalid
  (module (func $invalid-function-index
    (block (br_table 0 1 2 3 (i32.const 4)))
  ))
  "unknown label"
)
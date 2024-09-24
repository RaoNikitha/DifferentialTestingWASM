;; 8. **Test with Mixed Valid and Invalid Blocks:**    - Use a scenario where `br_table` targets include some valid blocks and some references to blocks that do not exist.      - **Constraint Checked:** Verifies proper checking and error handling for existence and validity of target blocks.      - **Edge Case Insight:** Confirms that invalid references are caught and handled appropriately.

(assert_invalid
  (module (func $mixed-valid-invalid-blocks
    (block (block (br_table 0 2 0)))
  ))
  "unknown label"
)
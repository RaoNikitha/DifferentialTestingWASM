;; 3. **Test Description:**    Use negative operand values for the br_table instruction to see if it appropriately triggers a default branch.    - **Specific Constraint:** Constraint that negative values should always use the default branch.    - **Edge Case Relation:** Improper handling may allow negative indices to access unintended memory spaces.

(assert_invalid
  (module
    (func $negative-operand
      (block (br_table 0 (i32.const -1)))
    )
  )
  "type mismatch"
)
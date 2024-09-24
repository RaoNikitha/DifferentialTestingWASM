;; 2. **Test for Negative Index:**    - Construct a scenario where the `br_table` instruction receives a negative index, leveraging signed integers incorrectly.      - **Constraint Checked:** Ensures the implementation handles or rejects negative indices as invalid inputs.      - **Edge Case Insight:** Confirms robust handling or correct error reporting for negative indices.

(assert_invalid
 (module
  (func $negative-index-br-table
   (block
    (br_table -1 (i32.const 0))
   )
  )
 )
 "invalid label index"
)
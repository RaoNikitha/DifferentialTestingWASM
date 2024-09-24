;; 1. **Test for Out-of-Bounds Positive Index:**    - Create a `br_table` instruction with multiple targets, such that the index provided is greater than the highest index available in the target table.      - **Constraint Checked:** Validates whether the engine properly handles cases where the branch table index exceeds the available targets.      - **Edge Case Insight:** Ensures the engine raises bounds error or defaults correctly per specification.

(assert_invalid
  (module (func $out_of_bounds_positive_index
    (block (i32.const 3) (br_table 0 1 2)))
  )
  "br_table index out of bounds"
)
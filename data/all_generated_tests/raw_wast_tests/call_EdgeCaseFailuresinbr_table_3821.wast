;; 10. **Test Description**: Use a `br_table` where the default branch forms a loop back to the start of the instruction sequence containing another `br_table`. This tests if cyclical branch patterns are correctly handled without leading to infinite loops or improper state handling.

(assert_invalid
  (module
    (func (block
      (br_table 0 0 0 (br 1)))) )
  "invalid branch table"
)
;; 1. **Test Description**: Create a `br_table` instruction with an index that is greater than the number of table entries, ensuring it defaults to the correct label.    - **Constraint**: This test checks that the `br_table` defaults to the correct label when the index is out of bounds since the default behavior must be explicitly handled.    - **Edge Case Relation**: Validates if the implementation manages out-of-bounds indices correctly, ensuring no undefined behavior.

(assert_invalid
  (module (func $br_table-default (result i32)
    (br_table 0 1 (i32.const 3) (block (result i32) (i32.const 1)))
  ))
  "unknown label"
)
;; 6. **Test Description**: Construct a `br_table` instruction without targets and provide an out-of-bounds index. Enclose the `br_table` with `nop` instructions.     - **Constraint Checked**: Check how indexing to non-existent branches behaves with surrounding `nop` instructions.     - **Edge Case Relation**: Absence of targets should be highlighted without being interrupted by `nop`.

(assert_invalid
  (module (func $br_table-nop (block (nop) (br_table 1) (nop))))
  "unknown label"
)
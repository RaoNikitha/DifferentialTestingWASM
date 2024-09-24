;; 1. **Test Description**: Create a `br_table` instruction with multiple valid branches and an out-of-bounds index. Surround the `br_table` with several `nop` instructions.     - **Constraint Checked**: Ensure `nop` does not interfere with the handling of an out-of-bounds index by `br_table`.     - **Edge Case Relation**: Out-of-bounds index should be properly caught without `nop` altering the expected behavior.

(assert_invalid
  (module
    (func (block (loop (br_table 0 1 2 (i32.const 4)) (nop) (nop) (nop) (end)) (nop)))
  )
  "unknown label"
)
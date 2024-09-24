;; 1. **Test Description:** Create a `br_table` instruction with a vector of labels and a default label. The operand stack contains an out-of-bounds index. Verify if the default label is correctly targeted. The test checks for edge cases where the index exceeds the label vector's length.

(assert_invalid
  (module (func $default-label-target
    (block (block (block (br_table 0 1 (i32.const 3)))))
  ))
  "unknown label"
)
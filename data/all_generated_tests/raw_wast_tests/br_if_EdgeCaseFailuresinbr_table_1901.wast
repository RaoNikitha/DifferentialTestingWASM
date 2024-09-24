;; 2. **Test with Maximum Integer Index**:    Use the maximum possible integer value as the index for the `br_table` instruction, testing if both implementations correctly handle extremely large index values and prevent out-of-bound access.

(assert_invalid
  (module (func $max-index-br_if (block (br_if 4294967295 (i32.const 1)))))
  "index out of bounds"
)
;; 3. **Test with Zero Labels in Context**:    Set up a `br_table` instruction in a context with zero labels, ensuring the test checks if both implementations correctly handle the absence of labels and prevent out-of-bound access.

(assert_invalid
  (module (func $zero-labels (br_if 0 (i32.const 1))))
  "unknown label"
)
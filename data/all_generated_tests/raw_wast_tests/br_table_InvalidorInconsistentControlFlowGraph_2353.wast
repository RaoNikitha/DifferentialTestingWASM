;; 3. **Test 3 - Inconsistent Label Indexing**:    Set up a `br_table` in a nested block structure where label indices are inconsistently relative to the current block's nesting depth, e.g., referring to labels beyond the innermost block. This tests the correct resolution of label indices and CFG consistency.

(assert_invalid
  (module (func
    (block
      (block
        (br_table 0 2 (i32.const 0))
      )
    )
  ))
  "unknown label"
)
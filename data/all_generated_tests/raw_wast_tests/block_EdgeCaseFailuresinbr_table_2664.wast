;; Design a block with a `br_table` where the indices are intentionally set to negative values. This edge case tests the handling of negative indices during the dynamic type parsing phase and how each implementation's error handling compares.

(assert_invalid
  (module (func $negative-br_table
    (block (br_table -1 0 1 (i32.const 0)))
  ))
  "unknown label"
)
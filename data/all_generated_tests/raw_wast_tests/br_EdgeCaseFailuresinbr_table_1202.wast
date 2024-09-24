;; 3. Design a `br_table` test with an index of `-1` to verify if both implementations correctly handle negative indices, specifically ensuring they do not cause an underflow or undefined behavior. This examines the label definition constraint.

(assert_invalid
  (module (func $br_table_neg_index
    (block (block (br_table -1 (i32.const 0))))
  ))
  "unknown label"
)
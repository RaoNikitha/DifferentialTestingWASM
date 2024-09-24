;; - Inject a `br_table` with an index that points to a label of a different block depth, breaking the structure and verifying if it raises a validation error appropriately.

(assert_invalid
  (module (func $branch-outside-scope
    (block (block (block (br_table 0 2 (i32.const 1)))))
  ))
  "unknown label"
)
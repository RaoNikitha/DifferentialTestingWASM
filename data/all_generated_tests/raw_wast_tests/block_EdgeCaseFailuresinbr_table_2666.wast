;; Write a block instruction that ends with a `br_table` where no valid labels match the target, ensuring the implementations properly handle the scenario where the index, even if valid, points to non-existent labels thereby testing block bounds and control flow edge cases.

(assert_invalid
  (module (func $br-table-unreachable-label
    (block
      (block
        (br_table 0 1 (i32.const 0))
      )
    )
  ))
  "unknown label"
)
;; 2. Implement a `br_table` instruction at the end of a nested block with an out-of-bounds index to check if the block's result type compliance is maintained correctly when the branch cannot find a valid target.

(assert_invalid
  (module (func $br_table-oob
    (block (result i32)
      (block (result i32)
        (br_table 0 1 (i32.const 2))
      )
    )
  ))
  "br_table out-of-bounds index"
)
;; - Use `br_table` with the largest possible index supported by the implementation to see if it manages large index values without overflowing or misinterpreting.

(assert_invalid
  (module (func $large-br-table
    (block
      (br_table 4294967295 (i32.const 1))
    )
  ))
  "unknown label"
)
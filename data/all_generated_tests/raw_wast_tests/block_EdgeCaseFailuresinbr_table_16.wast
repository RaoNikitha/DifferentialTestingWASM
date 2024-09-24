;; 7. Generate a differential test using `br_table` inside a block that attempts to branch to an index just beyond the maximum allowed value, ensuring type checks enforce stack consistency.

(assert_invalid
  (module (func $br_table-out-of-bound (result i32)
    (block (result i32)
      (br_table 0 1 2 3 (i32.const 5) (i32.const 0))
      (i32.const 1)
    )
  ))
  "invalid branch index"
)
;; Test 3: Use `br_table` in conjunction with a loop where the index refers to a target outside the loop's enclosing structure. This tests the implementation's ability to manage control transfers correctly within the nested labels.

(assert_invalid
  (module
    (func $br_table_invalid_index (result i32)
      (loop (result i32)
        (block (result i32)
          (br_table 1 0 (i32.const 0))
        )
      )
    )
  )
  "undefined label"
)
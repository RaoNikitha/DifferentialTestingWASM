;; 4. Use a `br_table` with an index that equals the total number of target entries. This tests the edge condition where the index matches the maximum bound to ensure boundaries are correctly managed.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 2 (i32.const 2))
        )
      )
    )
  ))
  "index out of bounds"
)
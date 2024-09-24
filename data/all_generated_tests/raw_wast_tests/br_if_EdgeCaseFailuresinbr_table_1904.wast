;; 5. **Test with Negative Index Handling**:    Implement a `br_table` instruction that takes a calculated negative index (due to some arithmetic operation on the stack), examining if both implementations robustly guard against invalid negative index values.

(assert_invalid
  (module
    (func
      (block 
        (i32.const -1)
        (br_if 0 (i32.const 1))
      )
    )
  )
  "invalid index"
)
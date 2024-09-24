;; 6. **Test 6**: A `br_table` instruction inside a `then` branch with an index at the maximum `i32` value, triggered by a true `if` condition.

(assert_malformed
  (module
    (func $br_table_max_index_true
      (if (i32.const 1)
        (then
          (br_table 0xffffffff)
        )
      )
    )
  )
  "unknown label"
)
;; 3. **Test 3**: An `if` instruction evaluating to true, executing a `then` branch with a `br_table` instruction having an index of -1 (invalid index).

(assert_invalid
  (module (func $test_if_br_table_invalid_index
    (i32.const 1)
    (if (result i32)
      (then
        (i32.const -1)
        (br_table 0)
      )
    )
  ))
  "invalid br_table"
)
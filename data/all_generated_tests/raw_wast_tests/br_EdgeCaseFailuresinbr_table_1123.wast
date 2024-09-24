;; Test 4: Use a `br_table` instruction with a negative index. This checks whether the implementation handles potentially invalid negative indices gracefully and defaults to the appropriate fallback behavior.

(assert_invalid
  (module
    (func $br_table_negative_index
      (block (result i32)
        (br_table -1 (i32.const 0))
      )
    )
  )
  "type mismatch"
)
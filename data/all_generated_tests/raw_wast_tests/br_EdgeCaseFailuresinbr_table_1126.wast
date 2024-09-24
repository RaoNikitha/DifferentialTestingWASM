;; Test 7: Construct a `br_table` instruction with a maximum valid index plus one. This tests if the implementation correctly handles an off-by-one error in the target table.

(assert_invalid
  (module
    (func $test-br_table (param i32)
      (block
        (block (br_table 0 1 (i32.const 2) (local.get 0)))
      )
    )
  )
  "invalid index"
)
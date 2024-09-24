;; Test 10: Design a `br_table` instruction nested within multiple `if` and `block` structures, with an index targeting the outermost `block`. This tests whether the implementation correctly manages and resolves deeply nested control instructions.

(assert_invalid
  (module
    (func $test
      (block
        (if (i32.const 1)
          (block
            (br_table 0 1 2 (i32.const 0))
          )
        )
      )
    )
  )
  "unknown label"
)
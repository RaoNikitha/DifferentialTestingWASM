;; 9. **Test with `br_table` in Nested Structures:**    Implement a `br_table` instruction inside nested blocks targeting controls at different depths. This verifies the correct interpretation of branches to various levels from a table-based branch.

(assert_invalid
  (module
    (func $test-nested-br_table
      (block
        (block (result i64)
          (i32.const 0)
          (br_table 0 1 2)
        )
        (i64.const 0)
      )
    )
  )
  "type mismatch"
)
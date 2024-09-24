;; Test 3: Create a `br_table` instruction with an empty target table and an index of zero. This test evaluates if the implementation correctly deals with a situation where no targets are available and any index should reference the default label.

(assert_invalid
  (module
    (func $br_table-empty-target-table
      (i32.const 0)
      (block (br_table (result i32) 0) (i32.eqz) (drop))
    )
  )
  "type mismatch"
)
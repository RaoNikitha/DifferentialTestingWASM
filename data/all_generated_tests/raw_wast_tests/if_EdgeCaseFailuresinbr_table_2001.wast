;; 2. **Test 2**: `if` with nested `br_table` that contains an index outside the bounds of the table's targets, testing for out-of-bounds error handling.

(assert_invalid
  (module
    (func $nested-br-table
      (i32.const 0)
      (if
        (result i32)
        (then
          (block $outer
            (block $inner
              (br_table $outer $inner (i32.const 1))
            )
          )
        )
      )
    )
  )
  "jump to nonexistent outer label"
)
;; 7. **Test 7**: `if` statement with multiple nested blocks each containing `br_table` that shares the same indices but different target sets, testing index handling with deeply nested control flows.

(assert_invalid
  (module
    (func $nested-if-br-table
      (block
        (block
          (block
            (if (i32.const 1)
              (then
                (br_table 0 1 2 (i32.const 0))
              )
            )
            (if (i32.const 0)
              (else
                (br_table 0 2 1 (i32.const 2))
              )
            )
          )
          (br if 1)
        )
      )
    )
  )
  "br_table index mismatch"
)
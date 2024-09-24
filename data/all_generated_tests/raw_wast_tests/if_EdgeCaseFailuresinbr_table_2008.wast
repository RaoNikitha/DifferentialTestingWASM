;; 9. **Test 9**: An `if` block where `then` contains a `br_table` with a duplicated target list and `else` contains a `br_table` with unique indices, checking for consistent index handling across branches.

(assert_invalid
  (module
    (func $test_if_br_table
      (result i32)
      (if (result i32) (i32.const 1)
        (then
          (br_table 0 0 (i32.const 0))
        )
        (else
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
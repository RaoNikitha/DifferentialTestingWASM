;; 5. Use an `if-else` statement where the `br_table` in the `then` block has a mix of valid and out-of-bounds indices, to verify if each implementation correctly handles mixed valid and invalid scenarios.

(assert_invalid
  (module
    (func $br_table_test
      (if (i32.const 1)
        (then (br_table 0 1 2 (i32.const 0)))
        (else (br 0))
      )
    )
  )
  "br_table has invalid index"
)
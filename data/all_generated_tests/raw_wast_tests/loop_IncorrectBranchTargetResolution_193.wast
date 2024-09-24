;; 4. Construct a loop with mixed `br`, `br_if`, and `br_table` instructions targeting varying levels of nested loops and blocks. Verify that each branch resolves to the appropriate target and handles label indices correctly, testing for consistent label management.

(assert_invalid
  (module
    (func $mixed_br_br_if_br_table
      (block $outer
        (loop $inner
          (br_if $outer (i32.const 1))
          (br_table $inner $outer $outer (i32.const 2))
          (br $inner)
          (loop $deep (br $deep))
        )
      )
    )
  )
  "type mismatch"
)
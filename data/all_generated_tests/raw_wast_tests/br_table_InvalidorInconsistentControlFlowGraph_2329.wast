;; 9. **Forward Branch Exiting Multiple Nested Constructs:**    Implement a `br_table` to forward branch through several nested control constructs, violating their structured nature. This test will ensure the CFG respects structured control flow constraints and flags invalid branching.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br_table 0 1 2 (i32.const 2))
          )
        )
      )
    )
  )
  "unknown label"
)
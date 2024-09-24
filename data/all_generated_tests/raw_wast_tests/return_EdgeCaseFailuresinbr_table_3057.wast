;; Test a `br_table` immediately before a `return` instruction where the index goes beyond the number of cases and see if web assembly's requirement for type match on the stack at outer contexts causes a difference as `Wizard Engine` might just set unreachable.

(assert_invalid
  (module
    (func $br_table-with-return (result i32)
      (block
        (br_table 1 2 3 (i32.const 0))
        (return)
      )
    )
  )
  "type mismatch"
)
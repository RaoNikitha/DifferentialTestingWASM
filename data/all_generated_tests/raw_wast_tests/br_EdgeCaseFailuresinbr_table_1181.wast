;; - Test a `br_table` instruction with a very large negative index to verify if it correctly handles the case or results in improper memory access.

(assert_invalid
  (module
    (func $large-negative-br-table-index
      (block
        (br_table -2147483648 (i32.const 0))
      )
    )
  )
  "unknown label"
)
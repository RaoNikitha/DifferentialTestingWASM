;; 6. **Test Description**: A `block` containing a table-based branch (`br_table`) with one of the table entries pointing to an `unreachable` instruction. This is to check if `check_seq` and the `validateCode` methods both ensure valid table indexing and prevent erroneous execution.

(assert_invalid
  (module
    (func
      (block (result i32)
        (i32.const 0)
        (i32.const 1)
        (br_table 0 1 (unreachable))
      )
    )
  )
  "unreachable code"
)
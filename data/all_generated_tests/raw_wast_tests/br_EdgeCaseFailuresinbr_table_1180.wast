;; - Test a `br_table` instruction with an index that is equal to the number of available targets, verifying if it correctly targets the default label or results in out-of-bounds error.

(assert_invalid
  (module
    (func 
      (block 
        (br_table 0 1 2 (i32.const 3))
      )
    )
  )
  "index out of bounds"
)
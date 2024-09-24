;; 3. **Test 3**: An `if` block containing a `br_table` where the index is zero but the table is empty, ensuring correct handling of empty tables.

(assert_invalid
  (module
    (func $test-br_table-empty
      (if (then (br_table 0 0) (else)))
    )
  )
  "invalid branch table"
)
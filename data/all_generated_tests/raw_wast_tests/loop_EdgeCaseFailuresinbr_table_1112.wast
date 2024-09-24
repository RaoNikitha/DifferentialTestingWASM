;; - **Test 3**: Utilize a `br_table` instruction with an index that underflows, such as a negative number, within a loop. This will test how each implementation deals with invalid negative indices and ensure proper error messaging and handling.

(assert_invalid
  (module
    (func $br_table_neg_index
      (block
        (loop
          (i32.const -1)
          (br_table 0 -1)
        )
      )
    )
  )
  "br_table with negative index"
)
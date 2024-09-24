;; 6. **Maximum Index Value:**    - Use the largest possible unsigned 32-bit integer as the index in a `br_table` instruction to verify that overflow edge cases are managed correctly.    - **Constraint:** Ensures that very large indices are correctly detected as out of bounds.

(assert_invalid
  (module
    (func $test-maximum-index
      (block
        (br_table 4294967295 (i32.const 0))
      )
    )
  )
  "index out of bounds"
)
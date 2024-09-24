;; 3. **Test Description**: Introduce a `br_table` instruction with a high index value intentionally set beyond the largest valid target index. Observe how each engine handles this overflow.    - **Specific Constraint**: Ensure the correctness of index bounds checking in `br_table`.    - **Relation to `call`**: Overflow checks in function indexing for `call` can be correlated and tested in this context.

(assert_invalid
  (module
    (func $test
      (param i32)
      (result i32)
      (br_table 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 
        (i32.const 21)
      )
    )
  )
  "unknown label"
)
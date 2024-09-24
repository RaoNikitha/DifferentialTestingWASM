;; 8. **Test 8: Large Jump Table with `br_table` Including Unreachable**    - A large jump table where one or more entries map to an `unreachable` instruction.    - **Reasoning:** Looks into handling large volume of targets to `unreachable`.    - **Constraint:** Tests if implementations handle large `br_table` indices and appropriate trapping.

(assert_invalid
  (module
    (func $large_br_table_unreachable (result i32)
      (block
        (unreachable)
        (br_table 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49
                  (i32.const 0))
      )
    )
  )
  "unreachable branch target"
)
;; Test 2: Use a `br_table` instruction with an index that significantly exceeds the number of available targets. This test validates if the implementation handles out-of-bounds indices by defaulting to an expected behavior (e.g., branching to the default label).

(assert_invalid
  (module
    (func $br_table-out-of-bounds
      (block
        (br_table 2 1 0 (i32.const 3))
      )
    )
  )
  "index out of bounds"
)
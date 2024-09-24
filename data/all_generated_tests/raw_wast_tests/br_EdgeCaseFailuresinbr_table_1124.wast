;; Test 5: Design a `br_table` instruction where all entries point to the same target, and the index used is `0` (i.e., selecting the first target). This test confirms whether the instruction correctly identifies and branches to the appropriate entry, even when targets are not unique.

(assert_invalid
  (module (func $test 
    (block (result i32)
      (block (result i32)
        (block (br_table 0 0 0 (i32.const 1)))
      )
      (i32.const 42)
    )
  ))
  "type mismatch"
)
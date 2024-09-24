;; 7. **Test 7:** Construct a function with `br_table` indices that are sporadically valid and include `unreachable` right after index calculations to induce a precise trap before any branching validation.

(assert_invalid
  (module 
    (func $test_unreachable_after_br_table 
      (block 
        (br_table 0 0 0 (i32.const 0))
        (unreachable)
        (i32.const 1) 
        (i32.add) 
      )
    )
  )
  "type mismatch"
)
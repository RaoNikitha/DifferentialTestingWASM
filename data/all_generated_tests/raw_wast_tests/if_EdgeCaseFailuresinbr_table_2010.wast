;; 1. **Test 1**: A `br_table` instruction with an index that is exactly equal to the highest target index, nested within the `else` branch of an `if` block with a false condition.

(assert_invalid
  (module 
    (func $br_table_test (param i32) (result i32)
      (i32.const 0)
      (if (result i32)
        (then (i32.const 1))
        (else 
          (br_table 0 1 (local.get 0))
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)
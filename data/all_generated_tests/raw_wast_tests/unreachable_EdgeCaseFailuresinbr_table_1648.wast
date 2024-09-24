;; 9. Combine a `br_table` instruction with non-consecutive indices for simplicity and end with an `unreachable` instruction to test index handling robustness. Ensure consistent trapping across implementations.

(assert_invalid
  (module 
    (func 
      (result i32) 
      (block 
        (result i32) 
        (i32.const 0)
        (br_table 0 1 1)
        (unreachable)
      )
    )
  )
  "type mismatch"
)
;; 5. **Test 5**: An `if` instruction evaluating a `br_table` with a high invalid index (> 100) in the `else` branch, validating handling of out-of-bounds indices.

(assert_invalid 
  (module 
    (func $out_of_bounds_br_table
      (if (result i32) (i32.const 0)
        (then (i32.const 1))
        (else (br_table 0 101 (i32.const 5))))
    )
  ) 
  "index out of bounds"
)
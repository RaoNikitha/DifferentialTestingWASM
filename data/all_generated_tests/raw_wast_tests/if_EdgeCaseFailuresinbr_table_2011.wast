;; 2. **Test 2**: A `br_table` instruction with an index that is one greater than the highest target index, placed at the end of a `then` branch that was not executed due to a false if condition.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (if (param i32) (result i32)
        (local.get 0)
        (then
          (i32.const 0)
          (br_table 1 0)
        )
        (else
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)
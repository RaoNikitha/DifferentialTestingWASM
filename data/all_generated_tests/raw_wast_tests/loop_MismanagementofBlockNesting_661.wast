;; - Test 2: Implement a deep nesting of `loop` within another `loop` and use a `br_table` instruction that branches to the outer loop based on a condition. This test evaluates if the depth tracking is correctly managed for the outer loop amidst nested loops.

(assert_invalid
  (module 
    (func $deep-nested-loop 
      (param i32)
      (result i32)
      (loop (result i32)
        (loop (result i32)
          (br_table 1 0 (get_local 0))
        )
      )
    )
  )
  "type mismatch"
)
;; - Test Case 4: Set up a loop with a `br_table` instruction where the operand index exceeds the bounds, defaulting to `unreachable`. This verifies correct default target handling in indirect branches.

(assert_invalid
  (module
    (func $br_table_out_of_bounds
      (param i32)
      (result i32)
      (local.get 0)
      (br_table 0 1 2 3 (then (unreachable))) 
    )
  )
  "type mismatch"
)
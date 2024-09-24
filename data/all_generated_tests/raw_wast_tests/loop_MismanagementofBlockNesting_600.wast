;; 1. Create a loop within another loop with a `br_table` instruction targeting different depths. Ensure that inner loop breaks to outer loop using different indices. Test to see if the correct outer loop is targeted.

(assert_invalid
  (module 
    (func $nested-loop-br_table
      (loop $outer-loop i32
        (loop $inner-loop i32
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
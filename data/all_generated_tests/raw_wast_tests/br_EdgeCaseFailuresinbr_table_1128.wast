;; Test 9: Implement a `br_table` instruction within a loop, ensuring the index references the start of the loop. This evaluates if the loop correctly handles the jump to its beginning, demonstrating handling backward branching properly.

(assert_invalid
  (module (func $loop_br_table
    (loop (br_table 0 (i32.const 0)))
  ))
  "type mismatch"
)
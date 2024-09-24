;; Test 6: Implement a loop with a `br_table` instruction that indirectly branches to multiple labels, some of which result in a type mismatch due to differing expected stack types. This checks handling of type constraints in indirect branching scenarios.

(assert_invalid
  (module (func $br_table-type-mismatch
    (block (loop $loop1 (result i32)
      (i32.const 1)
      (br_table $loop1 0 (block ) (block (result i32) (i32.const 1)))
    ))
  ))
  "type mismatch"
)
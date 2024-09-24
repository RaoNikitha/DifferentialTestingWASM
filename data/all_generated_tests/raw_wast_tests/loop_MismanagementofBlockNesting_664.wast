;; - Test 5: Write a loop instruction containing a nested block terminated correctly and then introduce a `br_table` instruction outside the nested block but within the loop. Ensure it selects the correct label while the nesting changes. This tests if branching is accurately managed after multiple block terminations within the same loop.

(assert_invalid
  (module
    (func $loop-br_table-nesting
      (block (loop (result i32)
        i32.const 1
        i32.const 0
        (br_table 0 1)
      ))
    )
  )
  "type mismatch"
)
;; 2. **Test 2:** Use a nested loop structure where an inner loop contains an `unreachable` instruction, with a `br_table` outside the loops attempting to jump to the inner loop:    - **Check:** Confirm that `unreachable` correctly traps and the `br_table` behaves as expected.    - **Constraint:** Verifies correct interaction of `br_table` with nested loops and `unreachable`.

(assert_invalid
  (module (func $nested-loop-unreachable-with-br_table
    (loop (loop
      (unreachable)
      (br_table 0 1 (i32.const 0))
    ))
  ))
  "type mismatch"
)